---
date: '2010-07-30 04:27:00'
layout: post
slug: state-of-the-virus-art
status: publish
title: State of the (virus) art...
wordpress_id: '881'
categories:
- Everything
tags:
- Security
- Virus
---

Imagine my surprise when one of my developers mentions he has a virus and I see this on his screen:

![](http://adamcaudill.com/files/2010/07/IMG_20100726_163201.jpg.scaled1000-300x224.jpg)
No, the items listed aren't the issue, it's [Security Tool](http://en.wikipedia.org/wiki/Security_Tool) that's the virus. It's vicious, plain and simple. It prevents almost all software from running (either by presenting a "virus warning" or simply killing the process), presents fake BSODs, and who knows what else that we didn't notice. Only Explorer and Internet Explorer were operational, all other software was disabled.

As soon as the issue was found, the workstation was removed from the network while we attempted a clean-up via [Malwarebytes](http://www.malwarebytes.org/) and a couple other similar tools. After running a scan from each tool in safe-mode it looked like we had it beat. We were wrong. The next reboot, and it was back - I'm not surprised but somewhat disappointed that none of the tools actually performed the cleanup correctly. There are several routes it could have taken to ensure that it would re-infect on boot, seems at least one of those was missed.

The one saving grace is that for some reason, it doesn't attack while in safe-mode. Had this not been the case, data recovery would have been far more time consuming than it was (about four hours). Once the data was secured and logs and various backups for later analysis were captured, the workstation was re-imaged. In total, probably 30 hours were lost among development, technicians, and networking - not to mention the time spent by the security team members. A rather costly exercise, all things considered.

There's still one question floating around - how did this happen? The workstation in question was running a fully patched Windows XP install, Symantec Corporate anti-virus with the latest updates, behind a firewall and content filters, yet it still happened. How did our pricey anti-virus solution not detect this? Why didn't it detect anything at all?

It amazes me that here in 2010 we still have to worry about computer viruses (or virii, if you prefer); but I find it utterly unacceptable that that a top-tier, fully managed and updated anti-virus product allows such a debilitating pile of code to execute. Computer science has made amazing strides and modern PC hardware has more than enough resources to perform more intense analysis and monitoring - yet it still happened.

Have we actually lost this battle?
