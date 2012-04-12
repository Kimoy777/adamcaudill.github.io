---
date: '2012-01-23 22:28:56'
layout: post
slug: poking-mykonos
status: publish
title: Poking Mykonos
wordpress_id: '1066'
categories:
- Security
- Technology
tags:
- Mykonos
- PCI
- Security
---

While checking on the latest updates in the start-up world from TechCrunch, I came across [their article](http://techcrunch.com/2012/01/23/mykonos-helps-companies-battle-hackers-raises-4-million/) on [Mykonos](http://www.mykonossoftware.com/); the important part of their article (at least for me), is this:


_Mykonos’s Web Security product uses deception to “detect, confuse, slow down and prevent attackers” in real-time in order to help companies protect their websites and Web apps from malicious hacker and proactively prevent fraud and theft._


A couple of minutes of reading, and my interest was piqued - to say the least. The thing that most interested me was the claim of no false positives, while they do [talk about it](http://www.mykonossoftware.com/early-detection.php) - I really wanted to see it for myself. Assuming they used their own product to protect their site, I took a few minutes to see what I could find - and find I did.

The first thing I did was a view-source to see what I could learn about their site - mainly to see if there were any obvious signs of using one CMS or another. The first thing that jumps out at me is this from the HTML:

    <!-- InstanceBegin template="/Templates/mykonos.dwt.php"
         codeOutsideHTMLIsLocked="false" -->

So, this tells us they are using Dreamweaver, and the name of the template. So, the next question is, does that [`/Templates/`](http://www.mykonossoftware.com/Templates/) directory exist on the server?


![File Listing](http://adamcaudill.com/files/2012-01-23_1930.png)


Yup.

So, not only does it exist, they have directory listings turned on - which to me was a real shock. Unfortunately for us though, these files are named with the `.php` extension and not the `.dwt` I was hoping for, so we can't get much useful from them.

So, from looking at the source of the home page, we can see that the css files are stored in a [/css/](http://www.mykonossoftware.com/css/) directory - maybe that'll be interesting.


![File Listing](http://adamcaudill.com/files/2012-01-23_1935.png)


It's there, and like last time, we can see all of the files. While CSS files are of no real interest, the [/_notes/](http://www.mykonossoftware.com/css/_notes/) directory is, because it'll contain a file called `dwsync.xml` - which can be quite interesting (since we knew they are using Dreamweaver, it's not too surprising to see this). This file contains data about the last time the site was pushed from Dreamweaver, and will contain one entry per file, and looks like this:

    <file name="style.css"
     server="ftp.belincreative.com/public_html/clients/mykonos/site/"
     local="129651858311162109"
     remote="129651936600000000"/>

The most interesting thing there is the `server` entry, as it tells us a little about the file-system; which if we were really trying to attack the site, knowing that would be handy. The other thing of interest is that when you see one `/_notes/` directory, you'll see lots more, as Dreamweaver likes to put them everywhere.

So, let's see if there's one in the root - that should be the most interesting one. Sure enough: [/_notes/](http://www.mykonossoftware.com/_notes/)

![](http://adamcaudill.com/files/2012-01-23_1949.png)

This one has a few interesting entries, such as a [PHP file](http://www.mykonossoftware.com/TechSpecsWhatsNew.html) that is named with an HTML extension - causing the code not to execute. Viewing the source of that file in the browser exposes the [/inc/](http://www.mykonossoftware.com/inc/) directory; potentially interesting, but yields little information. The next file I tried (knowing it would be way too easy if it worked), was the [.htaccess](http://www.mykonossoftware.com/.htaccess) file:

    <files "webadmin.pl">
    	AuthUserFile /usr/local/www/public_html/.htpasswd
    	AuthType Basic
    	AuthName "Server Administration"
    	require valid-user
    </files>

Now, at first glance things look too good to be true - and that's because they are. Look at the path in `AuthUserFile` and compare that to the entries from the `dwsync.xml` files. This `.htaccess` file is part of the trap, which is all but confirmed if you try to go to the [.htpasswd](http://www.mykonossoftware.com/.htpasswd) file which shouldn't work, since the path isn't what we would expect.

Now, while mucking around looking at the aforementioned files, and others such as [robots.txt](http://www.mykonossoftware.com/robots.txt), I would periodically see this, which I would assume is part of that "no false positive" promise:

![](http://adamcaudill.com/files/2012-01-23_1716.png)

I was hoping to run into the firewall (for lack of a better term) - looks like I got my wish; though since I wasn't using anything automated and was just poking around by hand, it didn't have any impact. Not terribly exciting, but it did provide some insight into what they are doing.

So far we've found a few interesting things, and bumped into their firewall, but that all pales in comparison to the last entry in the `dwsync.xml` file:

    <file name="local-site.zip"
     server="ftp.belincreative.com/public_html/clients/mykonos/site/"
     local="129695851046591796"
     remote="129695888400000000"/>

When I saw the file name I was shocked - could it really be? But I was right. It's a 59MB file containing everything on the site - all the PHP and everything else. Out of curiosity, I compared the `.htaccess` to that in the zip file, as expected it's quite different and more believable:

    Options +FollowSymlinks
    RewriteEngine on
    rewritecond %{http_host} ^mykonossoftware.com [nc]
    rewriterule ^(.*)$ http://www.mykonossoftware.com/$1 [r=301,nc]

That confirms what I suspected, the file I saw earlier was just part of the trap.

**So what have we learned?**

1). Mykonos makes a really cool product, and had I not known what I was up against (and thus less skeptical about everything) it probably would have killed a lot of my time - just as intended.

2). No matter what you put in front or your site or application,_ human mistakes are still your greatest risk_. A second set of eyes and a little paranoia go a long way in securing your systems, and stopping hackers.

3). Mykonos was either lucky or smart in that there was little on their site that shouldn't be seen by the public. If they were using a CMS with a database back-end instead of simple (mostly-)static pages, this could have been worse. If they had source code or other valuable IP on the server, a mistake like this could be devastating.

4). Mykonos should take some of their new-found cash and hire somebody to finish the audit of their site that I started. ;)

_Note:_ I notified Mykonos about that zip file before posting this (through a couple of channels), and I'm intentionally not linking to it. While I didn't see anything in there that would be an issue to be publicly disclosed, I'm sure they don't want it getting out. Hopefully by the time anybody reads this, they will have taken care of that file.

_**Update:**_ As expect, they've cleaned up the files I mentioned - and a bit more. In a [tweet](http://twitter.com/#!/dkoretz/status/162033710202486786) from the company's CEO, [David Koretz](http://www.davidkoretz.com/), he mentioned that they had left a surprise for me. So I went to my starting point (the `/Templates/` directory), and was greeted with this:


![Welcome & Thanks](http://adamcaudill.com/files/2012-01-25_0005.png)




Yeah, cool product and cool people. I'm impressed.
