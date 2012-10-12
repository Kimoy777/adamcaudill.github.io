---
layout: post
title: "UPEK Windows Password Decryption"
date: 2012-10-07 14:49
comments: true
categories: 
---

On August 28th ElcomSoft [announced](http://blog.crackpassword.com/2012/08/upek-fingerprint-readers-a-huge-security-hole/) that they had determined a method to extract Windows passwords from the registry for users of UPEK's fingerprint readers and Protector Suite software (UPEK is now owned by AuthenTec, which is now owned by Apple). What they didn't announce was the technical details of how they did it. Myself and [Brandon Wilson](http://brandonw.net/) have been working to recreate their research - and we have.
 
We have not been in contact with ElcomSoft, so this is an independent re-discovery of this vulnerability. ElcomSoft has committed to not release details, which I understand - but given how likely it is that others will determine this technique, I believe that this information should be available to pen-testers and auditors so that these insecure credentials can be identified.

###The Details

ElcomSoft blasted the security of UPEK's product, saying:

{% blockquote %}
we found that your Windows account passwords are stored in Windows registry almost in plain text, barely scrambled but not encrypted
{% endblockquote %} 

This isn't quite accurate - but certainly close enough. The data is stored in the following location (varies by version):

`HKEY_LOCAL_MACHINE\SOFTWARE\Virtual Token\Passport\4.0\Passport\<user>\ExData`

The first 24 bytes are header and size information, after the encrypted data there is a 4 byte number that indicates the number of bytes in the next section, the following bytes are used in the IV. The encryption key is 'generated' using a PBKDF2-like function that uses MD5 hashing, but unfortunately when storing data in the registry they aren't using a password - so the outcome is based purely on an MD5 hash that they are using as a 'seed' value. This means that the key used is always the same.

Better: the key is only 56 bits.

###AES-56

On the AuthenTec's website they mention using 56-bit AES (due to the old export restrictions) - this confused me for quite some time, not only does AES not support 56-bit (or anything else less than 128 bits), from looking at the algorithm trying to make it support a key size that isn't a multiple of 32 bits would be quite challenging. So how did they do it? They cheated.

They are actually using AES-256, and padding both the 56-bit key and IV with nulls. In other words, they are taking a very strong crypto and stripping it of its value.

###The Data

Besides the Windows password, the data also includes the domain and login (all in Unicode), along with other various bits that's less interesting from a pen-testing perspective. Looking at the raw data, you can identify the password from the `P1` header, `0x11` denotes the login, and `0x12` indicates the domain.

The biometric data may be of some interest, but not to me.

###Code

We've [posted](https://github.com/brandonlw/upek-ps-pass-decrypt) a proof-of-concept tool to Github, it's written in C#, and thus requires the .NET 4.0 framework be installed. I also plan to write a Metasploit post module, but it's not ready yet.

###UPDATE

So it turns out that AuthenTec [released](http://support.authentec.com/Downloads/Windows/ProtectorSuite.aspx) a patch for this on 9/18 - and we missed it (as did pretty much everybody else). We were alerted to the patch late on 10/10, and last night (10/11), we completed work on breaking it. We've updated the Github repository with the new code, it supports both the old versions and the new version they released on 9/18. They are now using DPAPI (among other things), so if you have the new version, you'll need to run it in the context of LocalSystem so that you can access the correct encryption keys. This can be done quite easily with `psexec` - see the [README](https://github.com/brandonlw/upek-ps-pass-decrypt#readme) for details.

From a security perspective, the new version is somewhat more secure - but obviously, still easily attacked. They are now using a 'seed' of 16 random bytes (which is stored in `ExData` and protected via DPAPI), which is then hashed with SHA1, the hash is then passed into their key derivation method to produce the 56 bit key that is used to encrypt the main data block. Within the main data block there is another DPAPI block where the password was previously stored - this was something of a surprise to us at first, as they had obfuscated the code to hide this part. This second DPAPI block contains the user's password, and can be easily decrypted with the same method used to decrypt the block containing the 'seed' data.

Both of the DPAPI calls use the same entropy data - a block of 0x86 bytes, at the beginning is the word 'Software' and a 0x01 at offset 0x2B and a 0x05 at 0x43 - and as said above, the DPAPI calls are made in the context of the LocalSystem user, and thus needs to be decrypted within that same context.

The new `homepass.dll` file contains new anti-debugging code, as well as obfuscated code to complicate reverse engineering - fortunately, or unfortunately depending on your point of view - these new 'protection' mechanisms are trivial to bypass. To avoid this becoming a cat & mouse game, we won't be releasing further updates to this code - but I think it's safe to say that it's fundamentally broken, and any fixes they release can be bypassed without excessive effort.

I would not trust this software in a corporate environment.

