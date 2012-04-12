---
date: '2007-01-17 22:20:17'
layout: post
slug: burning-isos-in-vista
status: publish
title: Burning ISOs in Vista
wordpress_id: '168'
categories:
- Software
- Technology
tags:
- CD
- Free
- ISO
- Microsoft
- Software
- Utilities
- Vista
---

Today I had to do something I've not done since I [switched](http://adamcaudill.com/2006/11/18/installing-vista/) to Vista: burn a ISO image. Normally I would just fire up [Nero](http://www.nero.com/enu/index.html) and be on my way; but my version of Nero is old, and I didn't feel like fighting with it. So I decide to find something new.

I found a fair bit of discussion on the topic, and a few highly recommended (and free) choices:



	
  * [ImgBurn](http://www.imgburn.com/) - This is a well polished application, it exposes a fair bit of information about what's going on, and some of the behind the scenes details. Novice tend to prefer knowing as little as possible, but for more advanced users, it looks like a winner.

	
  * [CDBurnerXP Pro](http://www.cdburnerxp.se/) - This one received a several recommendations, though I'd have to advise against it. While it seems like a well built application, it's obvious that it's not been tested on Vista (the warning about running on Windows 95 or Windows NT doesn't inspire confidence).

	
  * [ISO Recorder](http://isorecorder.alexfeinman.com/isorecorder.htm) - This is one that I didn't get a chance to test, though it sounds quite promising.


Of those I tested, all had the same major flaw: _none worked_. ImgBurn came the closest, though failed to actually start writing. After a quick search I turned up the reason: my old Iomega CD-RW drive was so old, it doesn't follow the standards newer drives implement.

So now I'm facing buying a new copy of Nero (as it's always worked for me), when I stumbled upon a writeup for [BurnCDCC](http://www.hanselman.com/blog/FreeISODiskImageBurningUtilityThatWorksOnVista.aspx).  Even though I thought it would be a waste of time, I went ahead and tried it. After downloading the whopping [69KB file](ftp://terabyteunlimited.com/burncdcc.zip), I fired it up, and sure enough; _it worked_!


> [![BurnCDCC](http://adamcaudill.com/files/2007/01/burncdcc.thumbnail.png)](http://adamcaudill.com/files/2007/01/burncdcc.png)


So if you'll looking for a free way to burn ISOs, and have and old, hopeless drive; BurnCDCC just might help. Seems to be a great little program, and I have to appreciate the simplicity. Something nice about software that does one thing, and does it very well.
