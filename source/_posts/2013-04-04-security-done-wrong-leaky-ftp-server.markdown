---
layout: post
title: "Security Done Wrong: Leaky FTP Server"
date: 2013-04-04 22:10
comments: true
categories: 
---

**Update:** I've just spoken to AMI, and received some very important information; so here are the key points and clarifications:

* To clarify, the 'vendor' I refer to is a customer of AMI; it is this customer's public FTP server that exposed this information.
* Per AMI, the signing key included in the 'Ivy Bridge' archive is a *default* test key; AMI instructs customers to change the key before building for a production environment. It's not currently known if the customer was following recommended practices.
* The 'Ivy Bridge' code was unmodified, meaning that the customer had not made any alterations to this specific copy.

AMI is preparing a press release. The 'vendor' still hasn't responded (to me or AMI).

Assuming the vendor was following AMI's instructions, the private key found on the vendor's public FTP server *should* have little practical value; though how this vendor was handling keys isn't known, so the usefulness of the key is also unknown. There is also the possibility of other AMI customers violating AMI's instructions. *We know we have a key; we don't know how it's been used.*

Publicly revealing the source code still has some potentially interesting implications, even with the assumption that the vendor was following AMI's instructions on key handling. As this code may be under additional scrutiny from researchers, it's likely that new flaws will be found that would have been missed otherwise.

--

A few hours ago I received a call from my frequent research partner, [Brandon Wilson](http://brandonw.net/), about an open FTP server hosted in Taiwan serving up some rather interesting data. Internal emails, various system images (and even the Ghost software!), numerous photos - some personal, some high resolution PCB images, private specification sheets, Excel documents loaded with private information - but that wasn't the worst.

In a folder called `code` was quite a treasure. The source code for different versions of [American Megatrends](http://en.wikipedia.org/wiki/American_Megatrends) (AMI) firmware - but there was even a bonus on top of that! They included their private signing key with the code in the 'Ivy Bridge' archive.

`308204A30201000282010100ED71D63F21FF0B4563A43D871D22448FC9...`

If you aren't familiar with how AMI does UEFI firmware upgrades, they were nice enough to produce [some documentation](http://www.uefi.org/learning_center/UEFI_Plugfest_2012Q1_v3_AMI.pdf) (PDF).

By leaking this key and the firmware source, it is possible (and simple) for others to create malicious UEFI updates that will be validated & installed for the vendor's products that use this 'Ivy Bridge' firmware. If the vendor used this same key for other products - the impact could be even worse. Even with a quick reaction, odds are users will be unprotected for some time. As users often don't install firmware updates unless they are having issues - I expect this one to be around for a while.

This kind of leak is a dream come true for advanced corporate espionage or intelligence operations. The ability to create a nearly undetectable, permanent hole in a system's security is an ideal scenario for covert information collection.

This vendor's lax (non-existent?) security could have much broader repercussions though. For AMI, they now have a major piece of intellectual property freely available for download by competitors. For users, this code could now be subject to new scrutiny - if a security issue is found in the firmware, it could potentially impact all users whose firmware is based on the leaked code.

If the code was old, as it's been when products like [Symantec's were leaked](http://www.zdnet.com/symantec-source-code-leaked-on-pirate-bay-7000004765/), this might not be so bad - but it's not.

{% img center /files/Screenshot_4_4_13_10_04_PM.png %}

References in the files indicate that the code is from sometime in February 2012 - so this is fairly current code. For AMI, I hope they perform a security audit of their code to make sure that this leak doesn't put users at excessive risk.

A foolish oversight now has the potential to impact many.
