---
layout: post
title: "Making BadUSB Work For You - DerbyCon"
date: 2014-10-02 22:15
comments: true
categories: 
---

Last week [Brandon Wilson](http://www.brandonw.net/) and I were honored to speak at [DerbyCon](https://www.derbycon.com/), on the work we’ve been doing on the Phison controller found in many USB thumb drives. This was my first time speaking at DerbyCon - it’s a great event, with a fantastic team making the magic happen.

Slides:
<iframe src="//www.slideshare.net/slideshow/embed_code/39583508" width="427" height="356" frameborder="0" marginwidth="0" marginheight="0" scrolling="no" style="border:1px solid #CCC; border-width:1px; margin-bottom:5px; max-width: 100%;" allowfullscreen> </iframe>

Video (which I’ve haven’t been able to bring myself to watch):
<iframe width="854" height="510" src="//www.youtube.com/embed/xcsxeJz3blI" frameborder="0" allowfullscreen></iframe>

Now that the dust has settled, I would like to provide some updates, thoughts, and extra information - and *maybe* correct an error I made during the presentation.

### The Demos
We did three demos - they were simple enough that I didn’t think there was any risk of having issues. Well, lesson learned.

The machine we used was a fresh Windows install just for the talk - though in the rush, there were a couple differences between it and the machine we had been testing with. In the panic of trying to get the talk done in the short 25-minute slot, I mistook these differences for a failing of one of the demos.

**Custom HID Firmware**

The first of the three demos was a completely custom firmware, that presents itself as a HID device (and as a mass storage device, though without media present - this is to make firmware updates easier) - the demo went without a hitch.

I would have liked to show the tools and the update process, though there just wasn’t time. Brandon is working on videos that will be posted to YouTube that walks through each demo step by step.

The team behind the [Rubber Ducky](https://hakshop.myshopify.com/products/usb-rubber-ducky-deluxe) saved us a lot of time, thanks to the tools they had built - as we were able to support the same encoded format they used.

**Hidden Partition**

The hidden partition is a great patch, as there’s no way to tell that it’s there - everything works as expected, no reason to suspect that anything has been altered.

It divides the NAND space into two partitions, and the firmware lies about the size, to indicate that only half of the space is there. The “public” section is the first that’s mounted, and only a specific action will cause the second, hidden partition to become visible.

It’s a simple change, but it sends a clear message that there can be more than meets the eye with these devices. From a forensics perspective, the only way to ensure that what you are getting is accurate and complete, is to dump the NAND directly - without allowing the controller to access it.

**Password Protection Bypass**

This demo *seemed* to go wrong, but it actually performed perfectly - I was just in too much of a rush to think though what was happening, and why I didn’t see what I expected.

When I plugged the device in, I was expecting to see two drives from it - one “public”, the other unmounted. I only saw one. Two things went wrong here:

* “Show Empty Drives In Explorer” - By default Windows doesn’t show unmounted removable drives in “My Computer”; this is a setting I always change, and expected to see the unmounted drive. As this was a fresh install, the default setting was still set - the drive was there, I just couldn’t see it. This threw me off.
* Wrong Password - During the demo I typed in some random junk to the password field of the “Lock” tool, and instead of it unlocking the drive as expected, it gave me the wrong password dialog. The issue here is a bug in the Phison code, when supplying a password more than 16 characters long it treats it as a bad password. So it was working, but the password I supplied was too long, triggering that bug.

We later tested that drive again, and sure enough - it worked flawlessly, as long as the random password wasn’t longer than 16 characters.

The patch works by altering the buffer that stores the data once received over USB; it forces it to 16 “A”s, so that any password will work. Because of how it works, the patch must be applied before the user sets their password - otherwise it’ll just make the data inaccessible.

That was painful.

### The (maybe) error…
During the talk I referred to modes 7 and 8 as being encrypted - this is *probably* wrong, at least on the devices we demoed. The two modes are password protected, and according to some documentation are encrypted, and according to other documentation they aren’t.

The question came up in a conversation after the talk - we’ve not had the time to dig into this feature more since then, but it’s looking like it’s just a password check with no encryption.

The password changing patch was added at the last minute, to replace another demo that we didn’t like - we identified the USB command being sent, and patched it. Due to time constraints we didn’t dig into the feature to verify the document (from a device manufacturer) was correct; after the question was raised we dug into a little more and looked for other documentation and code to support the claim - it looks like the document we were referencing was incorrect.

So, it looks like I misspoke - the patch still works as expected, though the feature itself seems to provide less protection than we initially though. Sorry!

### The Code & Docs
We have everything on the [repo](https://github.com/adamcaudill/Psychson) now, and we’ve added some additional documentation to the [wiki](https://github.com/adamcaudill/Psychson/wiki).

This isn’t simple to do - the code is complicated to write, and the effort to use the patches and custom firmware is a bit more than I’d like. We’ve tried to document things as well as we can, hopefully it’s easy enough to understand.

### Next Steps
We really hope that releasing this will push device manufactures to insist on signed firmware updates, and that Phison will add support for signed updates to all of the controllers it sells. 

Phison isn’t the only player here, though they are the most common - I’d love to see them take the lead in improving security for these devices. They have an opportunity to stand up and protect users - as the most common provider of these controllers, I’d truly love to see them take this as an opportunity to lead the industry.

What we’ve released just scratches the surface of what can be done here - until signed updates are enforced, there’s no telling what games these devices could be playing.
