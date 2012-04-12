---
date: '2009-06-19 15:24:56'
layout: post
slug: avatars-why-roll-your-own
status: publish
title: Avatars - Why roll your own?
wordpress_id: '431'
categories:
- Development
tags:
- Gravatar
- Software Development
- Tips and Tricks
- Web Design
- Web Development
---

I've been working on a project recently that uses avatars, while planning out this specific feature it occurred to me - why should we re-invent the wheel? There's already at least one service that specializes in doing it right: [Gravatar](http://en.gravatar.com/).

While building something as simple as avatar support takes a relatively small amount of time, when working against a tight deadline or a tight budget every minute counts. In the world of an ISV (especially a young one) the balance of user satisfaction and development time is critical. Using a service such as Gravatar is a great way to give the users what they want with minimal impact to the timeline.

With a [super-simple implementation](http://en.gravatar.com/site/implement) we were able to get it running within a few minutes - compare that to at least a few hours to build a custom system. Plus, reduced server load as we aren't hosting the images and a cleaner, simpler interface as it's one less option the user has to look through.
