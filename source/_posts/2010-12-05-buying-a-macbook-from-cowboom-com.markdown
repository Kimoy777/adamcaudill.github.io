---
date: '2010-12-05 01:08:23'
layout: post
slug: buying-a-macbook-from-cowboom-com
status: publish
title: Buying a MacBook from CowBoom.com
wordpress_id: '890'
categories:
- Everything
tags:
- Apple
- CowBoom
- iOS
- Mac
- Shopping
---

I have a project coming up that will require some iOS development – which means that it has to be done on a Mac. Seeing as I didn't own a Mac, and as the more I spent on acquiring one, the less money from this project will end up in my pocket; I needed a cheap solution. In the end I acquired a very nice 13" MacBook from CowBoom.com; so this is both about the deals that are available and a review of my experience with the seller.

The Options:



	
  * Retail: It is well-known that Apple rarely allows discounts; and when they do permit them, they are typically small. It's possible to save a few dollars by buying through Amazon (i.e. [here](http://www.amazon.com/Apple-MacBook-MC516LL-13-3-Inch-Laptop/dp/B002C7489S/)) or the like, but the savings is likely to be in the 5% range.

	
  * Hackintosh: For those not familiar, a hackintosh is a PC running a modified version of OS X to bypass hardware restrictions. Lifehacker has a great [hackintosh guide](http://lifehacker.com/5672051/how-to-build-a-hackintosh-mac-and-install-os-x-in-eight-easy-steps)that details all of the steps and hardware necessary to get it all working. Per the Lifehacker guide, it's a little over $900 once you figure in sales tax (if you're unlucky enough to live in TN as I do); by switching out a few parts (case, power supply, HDD), the price with taxes drops to a little over $800. This though, has a few issues:

	
    * Legality: Doing this violates the OS X license agreement, which is kinda significant.

	
    * Support: There is none, period. Your best bet is posting to forums and hoping that others have seen the issue before.

	
    * Consistency: Seeing as these boxes run a modified kernel, it's possible that these modifications could lead to inconsistent behavior between them and a real Mac; when you are writing software, this could be a big deal.

	
    * Updates: Apple has already intentionally [broken](http://osxdaily.com/2009/10/31/hackintosh-netbook-users-take-note-snow-leopard-10-6-2-update-kills-support-for-atom-processor/)support for Intel Atom processors to combat Hackintosh Netbooks which were becoming quite popular. You never know what they'll try to break in future updates.

	
    * Hardware: Seeing this isn't a supported configuration, hardware support is iffy at best. You have to carefully select what hardware will be used; ideally duplicating someone else's tested and confirmed-working build.




	
  * eBay: I spent the better part of a weekend looking through hundreds of listings; researching specs and features, comparing prices, and analyzing feedback. As is expected with eBay, there's a bit of everything: items beat to death, broken, way overpriced, or great deals that get snapped up almost as soon as you see them. The only thing missing is any form of consistency.

	
  * Craigslist/etc.: Quite similar to eBay, except with somewhat better prices and fewer choices.


After pouring way too many hours into the search, I ran across a post on slickdeals.net mentioning that CowBoom.com had a [good deal](http://www.cowboom.com/product/715713) on them. I'd never heard of them, and thinking them to be something of a joke thanks to the terrible name (my odd hatred of cows notwithstanding), but given the lack of progress – off I went to do some research. It turns out ta CowBoom was [developed](http://www.auctionbytes.com/cab/abn/y10/m04/i12/s01) by Dealtree, which BestBuy acquired in 2008; if it wasn't for the fact that there are backed by a major player, I would have just went on and ignored them.

Dealtree is effectively the liquidation arm of BestBuy, responsible for converting returns, damaged items, and the like into cash via different outlets; the better items go to CowBoom to be sold or auctioned.

When you buy something from CowBoom, you are presented with a list of individual units which includes a list of what's included or missing, its condition, and any inspection notes. You can go through this list to pick the one that looks best, and that's the one that will be shipped to you. It's a fairly nice system, though prices should be carefully checked; I've seen items that were several years old going for more than the current version as well as items going for more than retail (though this seems to be a fairly rare case).

After looking at their prices and the unit description ($689 for the current MacBook [$750 after taxes]), and seeing the 30-day [return policy](http://www.cowboom.com/rma/) – I decided that was the best route to go. So on the 19th I placed the order. Overall, I felt like I was getting a good deal and was rather happy.

This is where the warm-fuzzy starts to fade.

Despite ordering on the 19th, the package wasn't actually shipped until the 27th. It finally arrived on the 3rd, 14 days after being ordered; it came from California though I often have better turn-around times with packages coming from China. Needless to say, the shipping was a bit disappointing.

Knowing that it was likely a retail return certainly left me a bit wary, but being tested (or so they say) and covered by a no-questions-asked return policy made me more confident that in the end I would have a decent unit. It was packed quite securely, and I was quite relieved to discover that the laptop was in the original package; I pulled it out of the box and was surprised that it was in perfect condition, and that the power cord was still sealed with the original packaging. Jackpot. It would have cost me more than $1,100 after taxes to buy that same laptop from Apple.

The feeling of victory quickly faded though; I pressed the power button and nothing happened. No lights, no sound, nothing. After plugging it in, it booted up immediately; most laptops I've purchased were shipped at least partially changed so this seemed a bit odd to me. Being suspicious, I checked the battery information – it wasn't charging and was only showing 1 charge cycle. Now I know why it was returned.

It was an uncomfortable couple hours as I researched and tested different solutions; though after resetting the [SMC](http://support.apple.com/kb/ht3964) multiple times and numerous reboots – it started working. I've been using it pretty heavily over the last couple days while configuring it for development, since getting through that fist issue there's been no problems at all.

Overall, I've got a new MacBook that's in great condition with no issues for well under retail. Was the time and trouble worth it? I'm not sure.

_[Note: I apologize for the excessive length of this post; I originally intended to only write a few brief paragraphs, not a 1,100+ word essay. Perhaps now that I'm primarily writing code in C#, that tendency to verbosity that I learned from my Visual Basic days is expressing itself in my writing. After writing this I showed it to my wife and asked if it was too long; she quickly glanced to the bottom and asked where the "I Agree" button was. Point made quite clearly. I will endeavor for brevity in the future for posts such as this. If you have made it this far, please give yourself a cookie for me, you deserve it.]_
