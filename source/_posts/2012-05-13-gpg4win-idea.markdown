---
layout: post
title: "Gpg4win & IDEA"
date: 2012-05-13 03:22
comments: true
categories: 
---

Huge PGP files, an ancient version of PGP, and errors every time they tried to decrypt a file - that was my completely unexpected challenge on Friday. Dealing with file processing issues really isn't part of my job description, but I'm the closest thing my company has to an expert when it comes to encryption, so the task fell to me.

After looking at the options and issues to get the server upgraded to a non-stone-age version of the PGP software, the easiest answer looked like decrypting the files with GPG - it wasn't as easy as expected, but I did get some useful information that may help others.

###IDEA

If it wasn't for [IDEA](http://en.wikipedia.org/wiki/International_Data_Encryption_Algorithm) this would have been easy, but the keys used for this transfer were old (thankfully the data isn't sensitive) and IDEA it was. GPG [doesn't support IDEA](http://www.gnupg.org/faq/why-not-idea.en.html) due to various patents (most if not all of which are now expired), so that leaves us to use a rather old plug-in to fill in the gap. Unfortunately for me, the server that hosts up that plug-in is misconfigured, making it impossible to retrieve the file.

Thankfully there are [other sources](http://www.spywarewarrior.com/uiuc/gpg-idea/gpg-idea.htm) ([plug-in](http://www.spywarewarrior.com/uiuc/gpg-idea/ideadll.zip), [mirror](http://adamcaudill.com/files/ideadll.zip)).

###Gpg4win

I used [Gpg4win](http://www.gpg4win.org/) so I could decrypt the files from Windows - which had unexpected consequences. The current version of Gpg4win uses gpg version 2.0, which isn't compatible with the IDEA plug-in - a fact that isn't pointed out anywhere.

The key to making this work was to use an older version of Gpg4win - I used [v1.1.4](http://files.gpg4win.org/gpg4win-1.1.4.exe), which thankfully is compatible with the plug-in. Though I do wish I found this out a few hours sooner than I did.

###Setup

The setup for this is pretty simple, it's documented in a few places, but here is a quick wrap-up:

1. Install [Gpg4win v1.1.4](http://files.gpg4win.org/gpg4win-1.1.4.exe)
2. Download the [plug-in](http://www.spywarewarrior.com/uiuc/gpg-idea/ideadll.zip), and copy to `C:\Program Files (x86)\GNU\GnuPG\lib`
3. Update (or create if it’s not there) the `C:\Users\<user>\AppData\Roaming\gnupg\gpg.conf` file to include the following:

	`load-extension "C:\Program Files (x86)\GNU\GnuPG\lib\idea.dll"`

Once this is done, you can run `gpg --version` which will give you information about what algorithms are supported. It should look like this:

	>gpg --version
	gpg (GnuPG) 1.4.9 (Gpg4win 1.1.4)
	Copyright (C) 2008 Free Software Foundation, Inc.
	License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>
	This is free software: you are free to change and redistribute it.
	There is NO WARRANTY, to the extent permitted by law.
	 
	Home: C:/Users/Adam/AppData/Roaming/gnupg
	Supported algorithms:
	Pubkey: RSA, RSA-E, RSA-S, ELG-E, DSA
	Cipher: IDEA, 3DES, CAST5, BLOWFISH, AES, AES192, AES256, TWOFISH
	Hash: MD5, SHA1, RIPEMD160, SHA256, SHA384, SHA512, SHA224
	Compression: Uncompressed, ZIP, ZLIB, BZIP2

If you note the first item on the "Cipher" line is IDEA, that means it worked. If you don't see that - something went wrong, probably a bad path.

This version is able to handle the large files that old versions of PGP can't, and it allowed for a quick solution to the problem until we can upgrade the server.
