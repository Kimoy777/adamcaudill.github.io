---
date: '2011-01-12 02:00:42'
layout: post
slug: google-chrome-and-h-264
status: publish
title: Google Chrome and H.264
wordpress_id: '699'
categories:
- News &#038; Events
- Technology
tags:
- Apple
- Chrome
- Development
- Google
- H.264
- IE9
- iOS
- Microsoft
- Video
- Web Design
- Web Development
---

In a somewhat (but not entirely) surprising [announcement](http://blog.chromium.org/2011/01/html-video-codec-support-in-chrome.html), Google is removing support for [H.264](http://en.wikipedia.org/wiki/H.264/MPEG-4_AVC) video from Chrome. This change to their implementation of the often controversial HTML5 `<video>` tag is both a major step by Google and a furtherance of the already complicated world of video online.


_... To that end, we are changing Chrome’s HTML5  support to make it consistent with the codecs already supported by the open Chromium project. Specifically, we are supporting the WebM (VP8) and Theora video codecs, and will consider adding support for other high-quality open codecs in the future. Though H.264 plays an important role in video, as our goal is to enable open innovation, **support for the codec will be removed** and our resources directed towards completely open codec technologies._


When Google [released](http://techcrunch.com/2010/05/19/webm-google-h-264/) [WebM](http://www.webmproject.org/) (a royalty-free codec which Google [acquired](http://techcrunch.com/2009/08/05/google-acquires-video-compression-technology-company-on2-for-106-million/) as part of On2), it was clear that the intention was to take on H.264 and with this move there seems little doubt that the gauntlet has been thrown down. Although, now that H.264 has such a [strong base](http://techcrunch.com/2010/05/01/h-264-66-percent-web-video/) (it's included in [Flash](http://www.adobe.com/aboutadobe/pressroom/pressreleases/200712/120407adobemoviestar.html), [IE9](http://blogs.msdn.com/b/ie/archive/2010/04/29/html5-video.aspx), Safari, Mobile Safari, and Android), it really makes one wonder if Google has picked a fight that has long since been lost.

**So why would Google do this?**

Here's my best guess: Money (specifically, patent licensing).

H.264 is heavily encumbered by numerous patents owned by companies like Microsoft, Apple, and Cisco, and controlled by [MPEG LA](http://www.mpegla.com/main/default.aspx), the consortium charged with turning these patents into profit ([here's](http://www.mpegla.com/main/programs/avc/Documents/avc-att1.pdf) the 70 page list of patents for those interested). While I'm sure many people recall that MPEG LA made a very public pledge that H.264 would be [free forever](http://gigaom.com/video/mpeg-la-h-264-streaming-will-be-free-forever/), as is often the case, things aren't quite that simple.

[Peter Csathy](http://www.blogger.com/profile/06696465857424753507) wrote a fairly [detailed post](http://digitalmediaupdate.blogspot.com/2010/09/think-h264-is-now-royalty-free-think.html) on the matter, pointing out some key details that many in the media skipped. Here's the core of what wasn't discussed after the MPEG LA announcement (but should have been):


_But, you say, MPEG LA recently announced that it will no longer charge royalties for the use of H.264. Yes, it’s true – MPEG LA recently bowed to mounting pressure from, and press surrounding, WebM and announced something that kind of sounds that way. But, I caution you to read the not-too-fine print. H.264 is royalty-free only in one limited case – for Internet video that is delivered free to end users. Read again: __**for (1) Internet delivery that is (2) delivered free to end users**__. In the words of MPEG LA’s own press release, “Products and services other than [those] continue to be royalty-bearing.”_


[Mike Shaver](http://shaver.off.net/diary/), Mozilla's VP of Engineering offer's a somewhat similar take in "[Free as in Smokescreen](http://shaver.off.net/diary/2010/08/27/free-as-in-smokescreen/):"


_What MPEG-LA announced is that their current moratorium on charging fees for the **transmission of H.264 content**, previously extended through 2015 for uses that don’t charge users, is now permanent. You still have to pay for a license for H.264 if you want to make things that create it, consume it, or your business model for distributing it is direct rather than indirect._




_What they’ve made permanently free is distribution of content that people have already licensed to encode, and will need a license to decode. This is similar to Nikon announcing that they will not charge you if you put your pictures up on Flickr, or HP promising that they will never charge you additionally if you photocopy something that you printed on a LaserJet._


I'm just waiting for one of the licensors to reinterpret the license and claim that ads constitute a form of payment or some similar excuse to exclude them from the exception they granted. I've yet to get my hands on the latest licensing agreement to see exactly what it says about this, but I wouldn't be surprised at all to see this card played at some point to wring extra revenue from these patents.

Given that Google owns the massive video sharing site YouTube, which [uses H.264](http://youtube-global.blogspot.com/2010/01/introducing-youtube-html5-supported.html), plus whatever unknown projects relating to [Google TV](http://www.google.com/tv/) - it stands to reason that Google would certainly save some money by moving away from such an encumbered technology; not to mention avoid future risk should rules change. Though personally, I also have to wonder if it could be fears of a repeat of the [GIF patent](http://burnallgifs.org/archives/) debacle.

**Now where does this leave us?**

Right now HTML5 `<video>` is a mess, at best. There is a war for which codec becomes the de facto standard, and there is a _lot_ of money at stake depending on who wins. At this point there is no single codec that works across all major browsers; to get full coverage the best option now looks to be a combination of H.264, WebM, and Flash. Doesn't really sound like the progress that was promised with HTML5 does it?

It's worth noting though that Google isn't the first browser developer to reject H.264; both [Firefox](http://shaver.off.net/diary/2010/01/23/html5-video-and-codecs/) and [Opera](http://my.opera.com/core/blog/2009/12/31/re-introducing-video) have decided against including it in their browsers as well. As painful as the fragmentation is now in regard to who supports what, this move by Google actually does little to change the landscape. Support has been fragmented from the beginning, and all this really does it push H.264 a step away from being the de facto standard; a title that it has been very close to seizing.

Had Firefox added support for H.264, I think the fight would be over and would have made today's announcement almost suicidal for the project. Though with such a major player holding out against it, Google's move becomes a minor tactical shift in the short-term (though the long-term impact could be significant).

I could go on for pages about what works are where we are now, but [Mark Pilgrim](http://diveintomark.org/) (an infinitely better writer than I) sums it all up here: "[Dive into HTML5: Video on the Web](http://diveintohtml5.org/video.html#what-works)" - well worth reading if you want to really understand what's going on.

So in summary - video needs to be encoded to multiple formats, which today's announcement does little to alter due to the fragmentation that was already in place. In the long run, WebM may be better for the community due to its license, though many of the internet's biggest players have a vested interest in H.264. So when you factor in politics and propaganda between competing companies, distrust, and possible patent claims that haven't been addressed yet; this all leads me to an even simpler summary:

Yesterday, HTML5 `<video>` was a mess; tomorrow it will still be a mess.
