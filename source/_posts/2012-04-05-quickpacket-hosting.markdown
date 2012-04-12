---
date: '2012-04-05 02:00:21'
layout: post
slug: quickpacket-hosting
status: publish
title: QuickPacket Hosting
wordpress_id: '1168'
categories:
- Software
tags:
- Hosting
- Octopress
- QuickPacket
- WordPress
---

Continuing my long tradition of frequent host changes, this site has been moved to yet another host. In the last few years I've used a [number of hosts](http://adamcaudill.com/2009/06/13/switching-hosts-again/) (and there's a couple more not on that list), and this time I'm taking a bit of a risk - so it'll be interesting to see how this one works out. I've switched to a company called [QuickPacket](https://www.quickpacket.com/), but this time instead of a fairly beefy VPS, I've went in the opposite direction - absolute minimum.

The new plan is about as minimal as it gets:



	
  * 128 MB RAM

	
  * 256 MB vSwap

	
  * 1 CPU Cores

	
  * 20 GB Disk Space

	
  * 500 GB Bandwidth


The upside to this? It's only [$15 per year](http://www.lowendbox.com/blog/quickpacket-4-99m-128mb-xen-in-atlanta-ga-san-jose-ca-openvz-also-available/).

So I'm going to focus on caching and optimization to keep this and a few other sites running on such lean resources. In theory WordPress should be able to do it, if it can't - I'll switch to [Octopress](http://octopress.org/) or something similar.

This should be a fun challenge.
