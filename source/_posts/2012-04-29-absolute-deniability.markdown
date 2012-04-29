---
layout: post
title: "Absolute Deniability"
date: 2012-04-29 17:38
comments: true
categories: 
---

[ZeroBin](http://sebsauvage.net/wiki/doku.php?id=php:zerobin) ([code](https://github.com/sebsauvage/ZeroBin)) is a new and interesting piece of software to compete with services such PasteBin - largely in response to PasteBin's new aggressiveness in [removing objectionable posts](http://www.bbc.co.uk/news/technology-17544311). For PasteBin, it's easy to see why their policy changed - currently they can't deny knowledge of what they are hosting, it's plain-text and easily scanned (look [at this](http://www.leakedin.com/) if you don't believe me). ZeroBin on the other hand has taken a very different approach - to not just have [plausible deniability](https://en.wikipedia.org/wiki/Plausible_deniability), but absolute deniability.

The key to this is that ZeroBin stores pastes and discussions encrypted - and the encryption is performed in the browser, with a browser generated key. This means that the people running the ZeroBin software have no knowledge of what they are storing.

So, if they are asked to remove content, all they can do is remove specific named items - it would be impossible to remove all items that contain specific material (where if PasteBin was to be ordered to remove all items containing credit card numbers, it's a realistic possibility). As long as knowledge of the key remains limited - the paste will likely live on, no matter the content.

To make it even better, there are no accounts - so there's no way to see what a specific user is posting. With a properly configured server, this could be completely anonymous. With no knowledge of the content, no knowledge of users - it's the ultimate in deniability.

I really expect that this technique will become far more common in the future. It allows a much higher level of deniability for hosts and service provider, and greatly restricts the ability of investigators to research the activities of a user or group.

Take a closer look at this, I expect you'll see more of this.
