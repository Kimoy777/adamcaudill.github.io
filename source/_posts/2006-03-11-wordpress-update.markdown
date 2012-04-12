---
date: '2006-03-11 14:04:39'
layout: post
slug: wordpress-update
status: publish
title: WordPress Update
wordpress_id: '19'
categories:
- News &#038; Events
---

Yesterday the WordPress team [announced](http://wordpress.org/development/2006/03/security-202/) a new version of WordPress, the blogging software that powers this site, that resolves a couple security issues. So me, being the security conscious  person that I am, decided I had to upgrade, that was a _two hour_ adventure.

Due to some of the unique aspects of my theme, I've had to modify some of the core WordPress files, that turned out to be a bad idea. I had to convert all of the PHP & JS files to DOS format (after finding a Windows version of unix2dos) and then convert the diff file to DOS format, then the patching began. Getting the patch to apply to my modified files turned out to be an interesting experience, to say the least. Though after about 30 minutes of tweaking, the patch finally applied cleanly.

All in all, it took a little more than two hours, but now I'm secure again. :)
