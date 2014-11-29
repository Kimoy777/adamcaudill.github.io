---
layout: post
title: "Speaking at SC Magazine Congress"
date: 2014-11-23 17:12
comments: true
categories: 
---

Last week [Brandon Wilson](http://brandonw.net/) and I gave the lunch keynote at the [SC Magazine Congress](http://congress.scmagazine.com/page.cfm/link=16) event in Chicago. It was a fun, more executive level event - a big thanks to Eric Green and team. The talk was mostly an executive overview of what was discussed at [our DerbyCon talk](https://adamcaudill.com/2014/10/02/making-badusb-work-for-you-derbycon/), with some updates, and some insights.

Here are the slides, and a rough transcript from the event:

<iframe src="//www.slideshare.net/slideshow/embed_code/41900274" width="425" height="355" frameborder="0" marginwidth="0" marginheight="0" scrolling="no" style="border:1px solid #CCC; border-width:1px; margin-bottom:5px; max-width: 100%;" allowfullscreen> </iframe>

*(This is based on the speaker notes - so it doesn’t include the discussion and other bits that were said)*

**Slide 2:** (Adam) Hi, I'm Adam Caudill, I'm here today with Brandon Wilson, and we are here to talk about some research that we've been working on. We will be giving you some background information on BadUSB, showing it to you in action, and talking through the real risks.

**Slide 3:** (Adam) USB devices are truly ubiquitous - they are all around us. We all use them on a daily basis, but as is true for most technologies, the things that make our lives easier can be turned to attack us. This is a clear case of a technology that was designed to make life easier, but thanks to designers and implementers not fully understanding the potential for abuse, they have opened a door to attack vectors that most people don’t realize exists.

That USB is so common is both a blessing and a curse – from a convenience perspective, it’s great that USB devices and things that support USB are everywhere, but from a security perspective, there are costs, there are risks. Risks that few people realize that they need to be worried about. 

**Slide 4:** (Adam) BadUSB - the ability to take a seemingly harmless device and turn it into something evil, has been getting a lot of attention lately. We are here to talk about our findings, other research that's going on, how this research can be extended, and what it means for those trying to defend against attacks.

**Slide 5:** (Adam) First, lets talk about what BadUSB isn't - it's not an exploit, it's arguably not even a vulnerability. It's not a flaw in a device, or an oversight in a protocol. BadUSB, really, part behavior by design, and part carelessness on the part of device manufacturers.

BadUSB was first publicized by the Security Research Labs team from Germany, their work started with looking into a way to reprogram thumb drives to perform data processing - this led them to realize that the technique they intended to use to add features, could also be used by attackers.

Their talk at Black Hat USA was the first time many people heard about the possibility for such issues. It's their talk, and their decision to limit the details they released, that led us to change directions in some research we were doing, and get more details and code out to defenders.

Before we go too much further, lets talk just a little about USB, things most people don’t know about it.

**Slide 6:** (Brandon) When BadUSB was first introduced, the focus was on a design aspect of USB - something that has been used by legitimate designs for years, composite devices. In short, a composite device is a USB device that has multiple interfaces, or profiles, each exposing a different type of device. The classic case for BadUSB is a thumbdrive that is also a keyboard.

This isn't a vulnerability though - this is perfectly compliant with the USB specification. Devices are allowed to do this, it's intended behavior and by itself is not a bad thing. Of course, this doesn't just apply to being a mass storage device and a keyboard - NICs, printers, USB display adapters, webcams, and so on - any combination is possible.

So, for this part at least - it's a feature, a feature that can be abused.

**Slide 7:** (Brandon) To turn a thumbdrive into something more, it requires updating the device’s firmware - the code that resides on the device and makes it function. Many people see thumbdrives as just a data storage device, without realizing that there's a programmable controller inside.

These controllers are often user updatable, meaning that with only some software, anyone can perform the update. Why would the manufacturer want to let people update the firmware on a flash drive, you might ask? Well, there can be bug fixes, improvements to how it communicates with the NAND memory inside, better bad block management, etc. Where this becomes a problem though, is that some of the largest controller vendors don't enforce signed updates. So not only can any user update them, they can update them with any code they choose.

So this, the fact that they are selling chips that don't have any security considerations at all, is what turns USB's feature of allowing composite devices into a real attack vector.

**Slide 8:** (Brandon) Using firmware as an attack vector is far from new though, it's been done for years - though I don't believe that most people realize that so much research has been done that shows how weak many devices are.

We’ll get into some examples a little bit later, but people were reprogramming Apple keyboards to appear as other devices years ago, and a decade ago I was making graphing calculators show up as flash drives, so this is by no means new.

**Slide 9:** Here is a picture of a typical thumb drive -- there is the USB port of course, then that square controller chip which is the “brain” of the device (and what runs the firmware that makes the drive work), and then the NAND flash memory on the far left.

There are different vendors involved here -- NAND comes from one company, controller from another, sold under another name, etc. They’re essentially just putting the parts together, so there are a lot of different combinations out there.

**Slide 10:** (Brandon) Let's take a few minutes to talk about firmware...

For this talk, so we can have specific examples, we are going to talk about the Phison family of controllers - Phison is the largest maker of controllers used in thumbdrives, so that's why we are picking on them.

In this case, the device has a small boot image built into the controller itself, which is responsible for loading the firmware from the NAND chip and executing it - through the use of special applications on a PC, users can update the firmware with different, or modified versions. This is something most users know nothing about - but it's there.

**Slide 11:** (Brandon) Devices with updateable firmware aren't inherently evil of course, but the question is, does it use signed updates. Which is to say, do the updates include a cryptographic signature, based on a protected private key that only the device manufacturer has access to. If the answer to that is no - the devices doesn't validate the origin of updates, and it could be a target for a BadUSB style attack.

To be secure, devices need to validate all updates, using a non-updatable public key. This is the only way to ensure that the firmware is from a legitimate source, and not from some attacker. If the public key were updateable, then there's the risk that with physical access, or by taking advantage of a flaw, the key could be changed to an attacker-controlled public key - making it impossible to restore the device to stock firmware.

**Slide 12:** (Brandon) Even *if* a device uses only signed updates, that's not a guarantee that it's safe. There are many ways that an update system can fail - and it's important to remember that once these systems are developed, they tend to not be updated, so they are often using old or even obsolete technologies.

- Weak signing keys. Texas Instruments found this out the hard way, when their 512-bit RSA signing keys for their graphing calculator line were factored and publicly released, allowing anyone to release signed updates.

- Verification failures. There have been some systems that use signing - but never bother to actually validate it.

- Implementation failures. In one case, a system used string comparison to check if the hashes match - which worked great until there was a null byte in the hash (which is also used to indicate the end of a string in memory). This allowed attackers to steal a valid signature, with only a partial hash collision.

- Exploitable code. If the signature check cannot be defeated, and I’ve had to do this, there are often ways to bypass it completely by taking advantage of vulnerabilities in poorly-written code.

**Slide 13:** (Brandon) To take advantage of all of these possibilities, an attacker has to perform some significant reverse engineering. Most of the products that are likely to be targeted, have little or no documentation - there are no spec sheets, no SDKs. It requires reverse engineering the firmware, and using that to document and understand how the hardware works, and then use that to identify how to add or change functionality. 

**Slide 14:** (Brandon) On thumbdrives, being able to update firmware opens the doors to many things, not just the composite device attacks, but also changes in device behavior that makes it all but impossible to know if the device is behaving in a trustworthy way.

**Slide 15:** (Brandon) Thumbdrives are often used to transport sensitive information - but with modified firmware, it might not be doing what you think it is.

- Duplicating data to a hidden area for later retrieval
- Instead of deleting files, copying it to a hidden area
- Altering file contents when written - imagine writing a document to a drive, and later opening it to find that it says something else?
- Inserting malware into executables. The first time an executable is read (by antivirus software), it appears legitimate, but the second time it’s read (for execution), it’s completely different.

You can see where we are going here - once you can no longer trust the firmware of a device, you can't trust that anything it does or tells you.

**Slide 16:** (Brandon) A drive could also be modified to defeat forensic analysis. It's common to connect a thumbdrive to a write-blocker to protect it - but a write-blocker can't protect against the firmware. 

Something we designed, but aren't releasing, is modified firmware that expects to receive a special command from the PC it's connected to - if that command isn't received within the first few seconds, it then proceeds to erase the NAND, and destroy the firmware. Rendering the device unusable.

Within seconds of connecting it to a machine that doesn't pass the secret command, the drive is toast. With this type of firmware, the only way to dump the data safely becomes dumping the NAND directly, without allowing the controller to have power. And by protecting the NAND by coating it in a hard substance like epoxy, even dumping the NAND becomes problematic.

**Slide 17:** (Brandon) So, with all of that said - let's take a look at BadUSB in action, with some of the code that we've made publicly available. After we see it in action, we'll talk about where this research can go, and try to help you understand what the real risks are.

**Slide 18:** (Brandon) This first demo is just the classic “show up as a keyboard and type out a bunch of commands automatically” scenario, which has been in the wild for many years through other devices such as the USB Rubber Ducky device, development boards, etc.

What this drive will do is type out a one-line PowerShell command that downloads an executable from a server and executes it. This executable will open a shell so others can connect and do various bad things.

**Slide 19:** (Brandon) Next up, we'll show you a patch to the existing firmware to add a new feature for data exfiltration - a hidden partition that's only accessible via the right events.

The drive is divided in half, the first half of the drive shows up when you insert the device - if you look at it in "Disk Management" in Windows, you'll only see half the size, format it - half the size, query the device - same thing, half the size. Everything looks and acts normal. Format it, do whatever you want. This is hidden entirely in firmware, so the host device doesn't have a way to see what's going on unless the right bit is flipped. 

Until you eject the drive - not using the "safely remove hardware' option, but eject - after a few seconds it'll re-enumerate and mount a hidden partition. You can dump whatever data you like here, and either unplug the drive, or hit eject again to get back to the first, original partition a few seconds later.

This is a really simple way to hide data on a drive that appears to be empty. I wouldn't try to use it to get past the NSA, but it'll pass most checks.

**Slide 20:** (Brandon) Many drives support a mode that allows the contents to be protected by a user supplied password - until you enter the password, you can't see the content of the drive.

We've made a very simple patch to the firmware that changes the way that the password change function works. 

Normally you wouldn't be able to access the contents of the drive without knowing the user's password. With a simple change, we can change the password change function, so that it doesn't verify that the old password is right - so you can take a drive that has password protected content, apply our patch, and change the password to something you know, without ever knowing the original password.

This shows how a simple change in unsigned firmware can drastically change the security profile of the device.

So we'll take a drive, where I don't know the password, and set the password to something new.

**Slide 21:** (Brandon) – Here’s Adam to talk about where this research can go, and the implications and impacts of BadUSB.

**Slide 22:** (Adam) So far, all we've been talking about is thumbdrives - but that's just the beginning. How many people here knew that some keyboards and mice have user updateable firmware?

In 2009, K. Chen demonstrated an attack against Apple keyboards, it used the same technique behind BadUSB. Update the device with malicious firmware, have it open a reverse shell, win. 

This was from 2009, and what we are seeing with BadUSB is just another take on the same issue.

**Slide 23:** (Adam) This issue isn't unique to thumb drives - many different devices are subject to the same issues. So many devices that are routinely and thoughtlessly connected to computers can be updated with malicious firmware.

Even better - many of these devices are installed in laptops, and connect over USB internally. So it's possible that even internal peripherals could be attacked. The USB hubs integrated into motherboards are even a risk.

Now, I don't say this to make you paranoid, but so you'll have a better understanding of your attack surface. These devices are all around us, and any time one of them isn't in our control, it could be reprogrammed by an attacker.

Keyboards, mice, printers, webcams, touchpads, Bluetooth adapters, SD card readers, USB hubs - almost anything that connects over USB could be attacked this way. The problem is, nobody knows what is vulnerable.

Devices aren't labeled with what controller they use, and even for the same brand and model of a device, the controller used can vary. This makes it nearly impossible to determine what is and isn't at risk to this type of attack. 

**Slide 24:** (Adam) Shortly after we released our code, I got a call from a reporter at Wired asking for more information. One of the topics that came up is, could this be used to build a firmware based worm.

After the question was asked, I sat in silence for a moment before responding - this is not only something we had thought of, but Brandon and I had spent hours discussing the possibility. At first, it was because we thought it could be the basis of a great talk - but then, it turned into a discussion of risks, was such research too risky.

I finally answered - yes, it's possible, and we know how to do it.

This is the worst case scenario for BadUSB, a worm that infects the firmware of thumbdrives, and possibly other devices. Plugging an infected device into a machine could be enough to infect it, then it will spread from machine, to devices, to other machines. The devices could be made to be nearly impossible to clean - format the thumbdrives all you want, that won't get rid of malware in the firmware. This is a scenario we hope to never be seen in the wild, but with an attacker with enough resources, it's very possible.

**Slide 25:** (Adam) This is clearly a problem, and very much a risk, on multiple fronts for secure environments - so how is this being addressed? For the most part, it isn't. For me, there's a striking similarity between the way these manufacturers are reacting to this, and the way ICS manufacturers responded to security issues prior to Stuxnet. They ignored the problem until something so dramatic, so important happened, that they couldn't ignore it any longer.

I expect it'll be the same with BadUSB - at some point there will be an event that drives the point home that this issue has to be addressed at the root of the problem - the massive number of devices with insecure firmware updates.

**Slide 26:** (Adam) As Brandon said earlier, to pull of any of these attacks requires some significant reverse engineering work - if you have the right experience, it's really not that hard. It does take quite a bit of time though. So, these are practical attacks, but there aren't that many people that can do the work.

**Slide 27:** (Adam) This is one of the most common questions, and the hardest to answer. Some of these attacks can be more easily performed with other hardware - the pre-programmed keyboard that opens a shell for example, can be done with a USB Rubber Ducky, an easy to acquire pen-testing tool that looks just like a thumbdrive, but is actually much more. 

With USB development boards readily available, many things that are possible with BadUSB, are easier with better understood, well documented hardware. So, if an employee plugging in an unknown thumbdrive and it turning into a keyboard is a real risk in your environment - then BadUSB isn't the problem you should be worried about.

Now, things like the integrity of data on the device, the modifications to how a thumbdrive operates, that's a different issue, and one that's harder to protect against. If the drive is ever out of your control, you can't know if it's trustable. I hate FUD as much as anyone, but if you have a device that anyone can update to operate in ways that you don't want - if you ever lose control of it, you can't know if it's working for you or an attacker.

So, what's the risk? It depends on how much people want what you have.

**Slide 28:** (Adam) How many people here have policies that allow employees to use their own keyboard or mouse? OK, how many people think this happens even if it's against policy?

When most people talk about BYOD policies, they aren't thinking about the devices that connect to computers. But thanks to BadUSB, this is something that all companies should be thinking about - a user bringing in that Razer mouse they love so much, could actually be introducing a new attack vector, thanks to the updateable firmware.

I'm not going to recommend that companies ban all outside devices - but companies should be very aware of not just what's on their network, but what's connected to the things on their network. You can't protect against what you don't know about.
