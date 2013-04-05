---
layout: post
title: "Security Done Wrong: Leaky FTP Server"
date: 2013-04-04 22:10
comments: true
categories: 
---

A few hours ago I received a call from my frequent research partner, [Brandon Wilson](http://brandonw.net/), about an open FTP server hosted in Taiwan serving up some rather interesting data. Internal emails, various system images (and even the Ghost software!), numerous photos - some personal, some high resolution PCB images, private specification sheets, Excel documents loaded with private information - but that wasn't the worst.

In a folder called `code` was quite a treasure. The source code for different versions of [American Megatrends](http://en.wikipedia.org/wiki/American_Megatrends) (AMI) firmware - but there was even a bonus on top of that! They included their private signing key with the code in the 'Ivy Bridge' archive.

`308204A30201000282010100ED71D63F21FF0B4563A43D871D22448FC9...`

If you aren't familiar with how AMI does UEFI firmware upgrades, they were nice enough to produce [some documentation](http://www.uefi.org/learning_center/UEFI_Plugfest_2012Q1_v3_AMI.pdf) (PDF).

By leaking this key and the firmware source, it is possible (and simple) for others to create malicious UEFI updates that will be validated & installed for the vendor's products that use this 'Ivy Bridge' firmware. If the vendor used this same key for other products - the impact could be even worse. Even with a quick reaction, odds are users will be unprotected for some time. As users often don't install firmware updates unless they are having issues - I expect this one to be around for a while.

This kind of leak is a dream come true for advanced corporate espionage or intelligence operations. The ability to create a nearly undetectable, permanent hole in a system's security is an ideal scenario for covert information collection.

This vendor's lax (non-existent?) security could have much broader repercussions though. For AMI, they now have a major piece of intellectual property freely available for download by competitors. For users, this code could now be subject to new scrutiny - if a security issue is found in the firmware, it could potentially impact all users whose firmware is based on the leaked code.

If the code was old, as it's been when products like [Symantec's were leaked](http://www.zdnet.com/symantec-source-code-leaked-on-pirate-bay-7000004765/), this might not be so bad - but it's not.

{% img center /files/Screenshot_4_4_13_10_04_PM.png %}

References in the files indicate that the code is from sometime in February - so this is current code. For AMI, I hope they perform a security audit of their code to make sure that this leak doesn't put users at excessive risk.

A foolish oversight now has the potential to impact many.

*I've contacted both the vendor involved and AMI to alert them to the issue. Obviously, I won't be releasing the name of the vendor, the FTP address, or anything that was seen on the server.*
