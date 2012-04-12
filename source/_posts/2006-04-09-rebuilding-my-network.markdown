---
date: '2006-04-09 15:06:17'
layout: post
slug: rebuilding-my-network
status: publish
title: Rebuilding My Network
wordpress_id: '39'
categories:
- News &#038; Events
- Personal
---

Over the next three months or so I plan on more-or-less rebuilding all of my computers, and the network they sit on. This is going to be a fairly time consuming process, though I expect should be well worth it. This includes the addition on a couple new computers, as well as new hardware for the existing ones. Among the various changes is the move to a rack-mount environment, away from normal tower cases. I think this is going to be quite a project.

Here's how things look now:



	
  * Primary Desktop (WinXP, tower case)

	
  * Subversion Server (Win2000, tower case)

	
  * (Misc hardware strewn about)


On to the changes...

**Dell PowerEdge 2500**

The first (and largest) change is the addition of a used Dell PowerEdge 2500 server, that will server as a development SQL & Web server. This will eliminate the need to be running SQL Server on my primary PC.

[![powerfront.jpg](http://adamcaudill.com/files/2006/04/powerfront.thumbnail.jpg) ](http://adamcaudill.com/files/2006/04/powerfront.jpg)

This was a beefy server in its day, though it's somewhat underpowered for many of the more demanding projects servers have to deal with. This makes it a perfect development server. This allows a better view of the impact software can have on it, as well as being light on the budget, leaving money for more important things.

This box is currently setup with 1 PIII 933Mhz CPU (I plan on upgrading this), 512MB of RAM (it'll be seeing at least a couple of [these](http://www.newegg.com/Product/Product.asp?Item=N82E16820999201) in the rebuilding process), and **6** 18.2GB SCSI HDs. So it's far from top of the line, but it'll be a great development box.

**Primary PC**

![23513141.jpg](http://adamcaudill.com/files/2006/04/23513141.jpg)

My primary desktop is also my primary development box, this is the most important box on the network. Right now it's a Windows XP box, and will see the fewest changes of all the systems I have. The only major change will be moving it from it's existing tower case to a CODEGEN 4U-500-CA rack mount case. This is part of the move to consolidate all of my hardware and get rid of the 'towers on top of towers' issue I have now.

This is the first time I've tried to migrate from a tower to a rack-mount, so there may a couple "gotcha's" that I've not anticipated, I'm hoping this is a smooth move.

**Subversion Server**

For an existing system, the subversion server will see the most changes. This server started out as my desktop, and has by now been relegated to the role of hosting subversion, and thats about it. To make this box more useful, I plan on adding a [SABRENT RAID controller](http://www.newegg.com/Product/Product.asp?Item=N82E16816220001), as well as a couple Western Digital [160GB SATA](http://www.westerndigital.com/en/products/Products.asp?DriveID=137) drives (I'll add a couple more latter). This will allow it to server as not only the subversion server, but also as a file archive server.

The other change for this server is the move to the CODEGEN 4U-500-CA rack mount case, the same one I'm using for my PC. getting these boxes all in a rack will be quite nice I think.

**KVM**

![p11381a.jpg](http://adamcaudill.com/files/2006/04/p11381a.thumbnail.jpg)As a use a single keyboard/monitor for my separate computers, a KVM is a must. I'll be replacing my [existing](http://adamcaudill.com/files/2006/04/FUL1_F1DL102P.jpg) KVM, with a new one from JustCom. Based on the reviews I've seen, the [JC-104PE](http://www.newegg.com/Product/Product.asp?Item=N82E16817107056) looks like a nice choice for my needs, while trying to keep to a tight budget.

**Firewall / Router
**

After doing some research, and speaking to Andrew about his ideas (see comments), I've opted to pick up an older rack mount server from eBay, and using that as a firewall / router / VPN. It will most likely be running [CentOS](http://www.centos.org/), and using IPTables as the basis for the firewall functionality. This will eliminate the need for my current Linksys router.

Using a single box as the firewall & router should provide excellent performance, and be very secure.

**Switch**

The Linksys router is being replaced, adding the need for a new switch. I've opted for the [D-Link DGS-1008D](http://www.newegg.com/Product/Product.asp?Item=N82E16817111021), this is a Gigabit switch, and should bring a real speed boost over the current 100Mbit network.

**Linux PC**

![linux-penguin[1].jpg](http://adamcaudill.com/files/2006/04/linux-penguin%5B1%5D.thumbnail.jpg)This will probably be one of the last steps in the rebuild process. I'm going to be using the same CODEGEN 4U-500-CA case, along with an ASUS motherboard to form the basis of this system. This will most likely be running [SUSE 10](http://www.novell.com/products/desktop/preview.html), this will give me two fairly modern PCs, one for Windows development, one for Linux development. I image once that's setup, most of my PHP work will be done from there, should prove much easier than working on Windows.

**The Rack**

I've yet to figure out what I'm going to do for a rack to hold all of this. This is stall an open item in my plan.

**Thoughts? **

If anybody has any ideas or comments about the direction I'm heading, or the products I'm using, feel free to let me know.
