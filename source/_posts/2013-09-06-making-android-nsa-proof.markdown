---
layout: post
title: "Making Android NSA-Proof"
date: 2013-09-06 23:34
comments: true
categories: 
---

As it turns out, it's quite easy to make your Android phone NSA-proof. It's a simple method, and anyone can do it - all you need is a few ounces of thermite!

[{% img center https://farm2.staticflickr.com/1341/578831120_8ee93c49af.jpg %}](https://secure.flickr.com/photos/pkh/578831120/)

Too extreme?

Let's shoot for something a little more attainable - spy resistant. We can't stop every attack, but we can reduce the attack surface a bit. Here are a few tools that I've been using recently to do just that.

**[Boxcryptor Classic](https://www.boxcryptor.com/en/boxcryptor-classic)** - Like many people, I use DropBox for certain, low sensitivity files. But what about things that require a little more care? Boxcryptor Classic encrypts files and then stores the encrypted copy in DropBox. It's simple, security seems sound, and the free edition is quite adequate. May not be perfect, but suits my needs nicely.

**[TextSecure](https://play.google.com/store/apps/details?id=org.thoughtcrime.securesms)** - It's [open-source](https://github.com/WhisperSystems/TextSecure/), it's free, and it's from [Moxie](https://twitter.com/moxie) - what's not to love? It stores all of your SMS & MMS data encrypted, and can encrypt the data over the air when texting another TextSecure user. 

Currently it uses the SMS/MMS service for messaging, and is Android only; both of those things are changing soon. It'll be using the [data channel](https://whispersystems.org/blog/asynchronous-security/) and supporting [iOS](https://whispersystems.org/blog/iphone-rsn/) in the near future.

**[Kaiten Mail](https://play.google.com/store/apps/details?id=com.kaitenmail&hl=en) & [AGP](https://play.google.com/store/apps/details?id=org.thialfihar.android.apg&hl=en)** - Kaiten is a low cost ($4.99) mail client; though if you want to go cheaper, it's open-source cousin [K-9 Mail](https://play.google.com/store/apps/details?id=com.fsck.k9&hl=en) is free. They are developed by the same core team, though Kaiten seems to get the new features first, then they are ported into K-9. I like supporting OSS developers, so I happily went with the paid version. It works great with my Google Apps email account, though does take some getting used to.

Where it really comes in handy though, is when you use it with AGP, the Android Privacy Guard. It's a simple, minimalistic OpenPGP tool that integrates nicely with Kaiten and K-9. It makes it simple to support encrypted or signed mail on your phone.

This does though require that your private key be on the device, so keep that risk in mind.

AGP is a bit dated, and hasn't been updated since 2010. So, it's  clearly been abandoned. Thankfully though, [Dominik Schürmann](http://sufficientlysecure.org/) has [forked the project](https://github.com/dschuermann/openpgp-keychain) and is working on a major update (new GUI, new API, etc.) that should be ready early next year.

**[VpnCilla](https://play.google.com/store/apps/details?id=com.gmail.mjm4456.vpncilla&hl=en)** - Next up is a highly configurable VPN client ($4.99). WIFI is great - except that evil part of your traffic being so simple to monitor, and with recent work on [femtocell systems](http://www.theregister.co.uk/2013/07/15/femtocell_flaw_leaves_verizon_customers_wifi_and_mobile_wide_open/), even 3G/4G connections can't be fully trusted. Having a VPN handy is a must.

You'll also need a good VPN service; my current pick is [zipline](http://www.atenlabs.com/zipline/); it's fast, cheap, and from a trusted professional ([Dan Tentler](https://twitter.com/viss)).

**[RedPhone](https://play.google.com/store/apps/details?id=org.thoughtcrime.redphone&hl=en)** - Another tool from Moxie, RedPhone secures your voice communications via encrypted VoIP. Or at least so I've read - I never actually make voice calls on my personal phone anymore.

**Others** - There are various other useful things - Google Authenticator (2FA all the things, right?), ConnectBot to SSH into your server to do anything you don't want to do from your phone, use wifitrack & Wifi Analyzer to better understand what's in your area.

**Configuration**

There is, of course, obvious configuration to make things a bit safer. Make sure you have a good password, or at least a long PIN set - don't trust patterns, and don't bother with a 4 digit PIN.

USB debugging *must* be turned off - otherwise there's no point in locking your phone. Some other settings help, but not enough - one big one is Android's full disk encryption.

{% tweet https://twitter.com/gat3way/status/328550698558029824 align='center' %}

If you only have a short numeric PIN, the FDE is little better than a wet paper bag.

**Weak Spots**

It's not all great though, there are still weaknesses - plenty in fact. Thanks to USB MUXing there is probably a debug interface - and maybe even a full shell on your phone, and you have no way of turning it off. There may be flaws in the baseband or other software that could allow an attacker to gain control.

The list goes on and on. And that's without the fact that your phone company hands over all of your call records, or the various apps you need, but don't have a secure replacement.

There is no such thing as an NSA proof phone - unless you literally melt it. What we can do though is make it harder to be spied on; make the attackers work for every bit of data. Give nothing away for free.