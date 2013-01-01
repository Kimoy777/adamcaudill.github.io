---
layout: post
title: "Revisiting Snapchat API & Security"
date: 2012-12-31 17:41
comments: true
categories: 
---

As [Shapchat](http://www.snapchat.com) has increased in popularity, I've been asked several times to revisit my [Snapchat API & Security](http://adamcaudill.com/2012/06/16/snapchat-api-and-security/) post, to address the changes that they made in response to my complaints. So, here is it - sorta.

I started making detailed notes and looking at the changes they made - but yesterday [@tlack](https://twitter.com/tlack) made that mostly irrelevant with his release of [Snaphax](https://github.com/tlack/snaphax), a PHP library to interact with the undocumented Shapchat API. So for now, if you want to know more about their API or if you just want to save images or video - I'd suggest taking a good look at the Snaphax code. What I will do though, is talk about some of their changes and what they did right and what they did wrong.

**Retrieving images is now destructive...**

In the previous API version, you could request the same image from the `blob` API any number of times, until `ss_pa` was called to delete the image from the Snapchat servers (which occurred only after the image was viewed, opening a window to save the image before viewing it in the application) - the new `ph/blob` API removes the image once it's been delivered to the client. Without the ability to pull the image multiple times, 'downloader' tools are far less attractive - instead, to consistently download the media, users will need full replacement clients. This extra bit of inconvenience is probably one of the most effective deterrents against lazy attackers (likely the most common scenario).

**ECB mode, really?!?!**

Media is encrypted when it's sent to the client - this makes it harder to capture data via a MiTM attack, and makes it slightly more complicated to build alternate clients. But, there are a few issues:

* The media is encrypted with AES, in [ECB mode](http://en.wikipedia.org/wiki/Block_cipher_modes_of_operation#Electronic_codebook_.28ECB.29) - I can't imagine how they made such a mistake.
* Media is decrypted before going into the cache, instead of when it needs to be displayed - allowing it to be accesses on rooted devices.
* A single, hard-coded key (`M02cnQ51Ji97vwT4`) is used to encrypt the data.

Pretty much everything here could have been done better; some of the problems are just simple mistakes, others a result of ignorance.

**Security by obscurity...**

When looking at the traffic that the application generates, one of the first things you notice is the new `req_token` field - at first glance it looks like a SHA-256 hash (and has been mistaken for one more than once), but it's not - it's two SHA-256 hashes that have been merged in a specific pattern. All of the data to generate this token is already included in most requests (path, timestamp, auth token), but the secret to generating it is the algorithm used to merge them into one. 

Prior to @tlack's work, this token has been a stumbling block to those attempting to unravel the API - only because of the obscurity of their custom merger algorithm. Now that there is code that demonstrates how this works - the security benefit of the `req_token` has been completely eliminated. When you rely on the secrecy of an algorithm, it will bite you.

**Doing it right...**

Making a product like this work is quite easy - making it work right is extremely hard. Snapchat has entered a business where at least some of their users place an extreme amount of trust in them - a failure of their security could have a profound impact on their users lives. Any company that is in the business of handling very private communications is held to a higher standard - and Snapchat is no exception. Security should be the top priority when working on a product like this - and when you see such blatant mistakes as using ECB mode encryption, it's obvious that they don't take it seriously enough.

Snapchat needs to hire an outside security consultant to review their systems to identify the flaws such as those I've pointed out and provide real solutions - and they have the [money](http://www.businessinsider.com/snapchat-raising-8-million-from-instagram-backers-2012-12) to do it. Until they do, there will continue to be these cat and mouse games - and they'll lose every time.

