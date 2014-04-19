---
layout: post
title: "phpMyID: Fixing Abandoned OSS Software"
date: 2014-04-19 12:43
comments: true
categories: 
---

[phpMyID](http://siege.org/phpmyid) is a simple solution for those that want to run their own OpenID endpoint - the problem is that its author stopped maintaining the project in 2008. Despite this, there's still quite a few people that use it, because it's the easiest single-user OpenID option available.

Unfortunately, the author didn't follow best practices when building the software, and as a result multiple security flaws were introduced. In 2008, a XSS was identified and never fixed ([CVE-2008-4730](https://cve.mitre.org/cgi-bin/cvename.cgi?name=2008-4730)), in the years since then it seems the software has been below the radar. While conducting a pentest I discovered a previously undocumented XSS (CVE-2014-2890) - which left me with a dilemma - what to do about it?

Looking at the code, I found a couple more potential XSS vulnerabilities - so the application clearly needed help, and if the author won't do it, somebody should. Ethically, it seemed wrong to disclose the issue but leave users to fend for themselves; full disclosure is normally used to push a vendor into acting - but in this case it's assured that there won't be a vendor response.

**Fixing The Code**

One good thing is if a OSS project is abandoned, anyone can prepare patches to fix the issues. So, [that's what I did](https://github.com/adamcaudill/phpMyID). I've committed fixes for both CVE-2008-4730 and CVE-2014-2890, as well as a couple potential issues. In both cases, the fix was easy:

CVE-2008-4730:

    @@ -439,7 +439,7 @@ function checkid ( $wait ) {
      	if ($trust_root != $return_to) {
      		// the urls are not the same, be sure return decends from trust
      		if (! url_descends($return_to, $trust_root))
     -			error_500('Invalid trust_root: "' . $trust_root . '"');
     +			error_500('Invalid trust_root: "' . htmlentities($trust_root, ENT_QUOTES) . '"');
    
      	}

CVE-2014-2890:

    @@ -568,7 +568,7 @@ function checkid_setup_mode () {
       */
      function error_mode () {
      	isset($_REQUEST['openid_error']) 
     -		? wrap_html($_REQUEST['openid_error'])
     +		? wrap_html(htmlentities($_REQUEST['openid_error'], ENT_QUOTES))
      		: error_500();
      }

I've only given the code a quick once-over, so there may be other issues - if I find time for a more thorough review I may commit additional fixes.

**Status of phpMyID**

I'm not taking over the maintenance of the project, I simply don't have time to do the cleanup needed to bring it up to reasonable standards. I'd love to see somebody with a little time to invest cleanup the code and add more defensive measures. It needs some help, that's clear.

One of the things I'd love to see fixed is the way the user's password is stored - it's currently stored in the `MyID.config.php` file as a MD5 hash - making brute-forcing entirely too easy. Hopefully [this](http://tools.ietf.org/html/draft-ietf-httpauth-digest-06) Internet Draft will be adopted soon, obsoleting [RFC 2617](http://tools.ietf.org/html/rfc2617), which will be an easy win to improve the security of the password when in transit. There are many places where the code can be improved by somebody with a little time.

If you are using phpMyID today, replace the `MyID.php` file with the one [here](https://raw.githubusercontent.com/adamcaudill/phpMyID/master/MyID.php) (it also fixes compatibility with PHP 5.4).
