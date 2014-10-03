---
layout: post
title: "On The Ethics of BadUSB"
date: 2014-10-03 12:28
comments: true
categories: 
---

Last Friday, [Brandon Wilson](http://www.brandonw.net/) and I gave a talk on BadUSB at DerbyCon - I wrote some [about it yesterday](https://adamcaudill.com/2014/10/02/making-badusb-work-for-you-derbycon/). Yesterday, Wired [published](http://www.wired.com/2014/10/code-published-for-unfixable-usb-attack/) an article on the talk, kicking off several others - only the authors of the Wired and [Threatpost](http://threatpost.com/badusb-attack-code-publicly-disclosed) articles contacted us for input.

There has been some questions raised as to the responsibility of releasing the code - so I want to take a few minutes to talk about what we released, why, and what the risks actually are.

## What we released.
We released a two patches to the existing (v1.03.53) firmware for the Phison 2251-03, and a minimal custom firmware for that same chip.

**The Patches**

First, let me briefly describe the patches:

* Hidden Partition - A patch to create a second hidden partition, to show that data can be hidden, and not easily accessed unless you know the trick.
* Password Bypass - A patch to modify the password protection mechanism to force the password to fixed value; so that any password will be accepted. Must be applied before the password is set by the user.

The second patch does defeat a “security” mechanism on the device, though given that the patch must be applied before the password is set - it’s not a huge risk to users. We intentionally focused on changing behavior instead of adding composite devices, to show that the is more complex than what was displayed at the Black Hat talk.

So we’ve bypassed one security feature, and added a new feature.

The patches were carefully selected to make the point, while not endangering users.

**The Custom Firmware**

The custom firmware acts a HID device, typing out a pre-programmed payload when inserted to a computer. This is anything but new - this can be done with a [USB Rubber Ducky](https://hakshop.myshopify.com/products/usb-rubber-ducky-deluxe), a [Teensy](https://www.pjrc.com/teensy/), or a number of other devices. 

This was released to prove the point that the device could be reprogrammed to be something completely different. If this is a new threat to anyone - they are very out of the loop.

**The Tools**

We also released a few tools that we developed to apply patches and to make our lives easier during the effort. Most of what they do is available in other tools from Phison or the device manufactures; we built the tools we needed, so we didn’t have to use third-party tools or deal with the limitations of those tools.

## What we DIDN’T release
Now that we’ve talked about what was released, let’s talk about what it isn’t.

**Self replication** - There’s no self replication code anywhere, while it’s possible that it could be done, and we’ve talked about how to do it - it won’t be released. 

I am confident that we (Brandon and I) could build a system that would infect PCs, then infect a significant percentage of thumb drives, and then infect other PCs - but, and this is a *big* but - what we released doesn’t make that easier in any significant way.

Your average script kiddy will never be able to do it; there’s only a small number of people that would be able to do the work needed to be able to pull it off - those people could already do it before we released what we did.

The threat of this happening is the same as it has always been.

**Malware** - There’s nothing malicious about what we’ve released here. While we did release a patch to modify the password protection feature - that’s all it does. It doesn’t modify data, infect computers with anything, or anything of that nature. 

It changes the way a feature works. That’s it. This is a change that anyone with the required skills could have made - by making it public, we are raising awareness that users shouldn’t blindly trust.

**The end of USB as we know it** - Nothing, nothing, that we’ve released has suddenly made new attacks possible. The USB specification allows composite devices to do unexpected things. USB devices (thumb drives or otherwise) that allow anyone to update the firmware without any checks, means that anything can potentially be reprogrammed to change functionality or become malicious.

All of these things have been true long before we released the first line of code. Anyone that believes otherwise doesn’t understand the technology.

**An unfixable issue that will end the world** - While there isn’t quick fix for this, things can be improved quite a bit. We released simple code, that proves the issue, draws attention to the fact that users need to be more careful, while being careful to not cause more harm than good in the process.

This isn’t earth shattering. Anyone that thinks that it is, should probably give up and go live in a cave.

## The Risks
What are the real risks here - what does this expose users to that it didn’t in the past?

Writing code for these devices is far from easy, especially when trying to patch the existing firmware. It’s not something that just anyone can jump into - while we have made it easier for people to apply simple patches and provided some insight to the process, these aren’t the patches that will lead to a firmware based worm or something of that nature - these are the type of patches that will make small changes to existing features, or add simple new features. Even then, it’s time consuming and difficult work. 

So, to do anything still requires a lot of knowledge and skill - in general, as I said earlier, the kind of people that have what it takes to do this, could do it regardless of our release.

If a person (or group) was so inclined to take one of these devices and make it truly malicious - it’s unlikely that our research would have an impact.

I firmly believe that by releasing this code, the risk to the average user isn’t increased at all over what it already was.

## Why release?
Device manufactures were quick to dismiss the “BadUSB” threat - on one hand, what was presented at Black Hat was possible via other means, so wasn’t really a new threat - but they showed no indication of trying to address the issues under their control.

For years devices have been sold with updatable firmware, but with no security checks at all - we had two goals with the release of the code:

* User awareness - As long as users implicitly trust devices, attacks will be possible and successful.
* Push device manufactures to implement signed updates.

While it will take years for any changes made by device manufactures to have an impact because of the number of devices in circulation now - if they keep ignoring the issue, then it will never be improved.

In doing this, we haven’t broken the security of these devices, but made it clear that it isn’t existent. If anyone is upset that we’ve removed the obscurity that had “protected” these devices - then to them I’m sorry that they understand so little that they believe that it’s real protection.

Part of the reason we released the “hidden partition” patch was to show that this can be used to add new features, that can add value in certain cases.

## The Full Disclosure debate
When we started on this, we were concerned that this was being touted as a new threat, yet for defenders there was no way they could even test it, much less develop defense techniques. 

So not only do we have something that defenders can’t test, we have something that the device manufactures are downplaying or ignoring. This is the setup for the classic full disclosure debate.

The first question that we asked ourselves, before we wrote the first line of code, is what is best for users? To allow the status quo to continue, or to expand the research into new directions and publish - to help make users aware and provide defenders something to work with.

The answer we came up with, is that we could develop patches that would clearly communicate the issue, without causing undue harm to end users. 

In the end, looking at what we intended to release, what could be done that wouldn’t have been possible before that (which is fairly minimal), and the potential benefit - we felt, and still do, that full disclosure was appropriate.

In everything we’ve done, the priority has been protecting users - any media report that indicates otherwise is ill-informed, and providing bad information to the public.

## Breaking out of the echo chamber
Given that the issue was so well known, the amount of attention - positive and negative - that this has received has really surprised us. It’s too common that when something like this is released it stays within the infosec echo chamber - this has broken out far more than I expected.

Most of the negative feedback has been from people and organizations that are well outside of the echo chamber - reminding me of just how ignorant the public can be when it comes to technical issues.

There are times that I wonder why we work so hard to protect these people.

## Has this been blown out of proportion?
Yes.
