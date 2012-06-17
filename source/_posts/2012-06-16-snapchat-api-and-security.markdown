---
layout: post
title: "Snapchat: API &amp; Security"
date: 2012-06-16 21:06
comments: true
categories: 
---

**Update:** I heard back from one of the co-founders, he said that they'd be updating the application to address this in the "very near future." I have to applaud them for the great way they handled this.

[Snapchat](http://www.snapchat.me/) was recently [featured](http://techcrunch.com/2012/06/08/snapchat-110-million/) on TechCrunch, pointing out that they are expanding to Android and that they've now handled over 110M pictures. So when I see something about an application that auto-deletes messages after they are viewed - I did the only natural thing: dig in and see if it really is secure.

I [monitored](http://adamcaudill.com/2012/06/10/monitor-iphone-http-s-traffic-with-fiddler/) the messages being sent back and forth, and mapped out the APIs they use. They have a simple API, which uses both JSON and form-encoding to transfer data. The API itself is fairly clean and easy to understand. Writing a new client against this API is fairly simple - _including a client that automatically saves all image received_.

###Downloading Images

The process to download images is pretty simple, it can be as simple as two API calls. The first API needed is `ss_auth` - the API is used to create sessions. The call to login looks like this:

    POST https://feelinsonice.appspot.com/ss_auth HTTP/1.1
    Host: feelinsonice.appspot.com
    User-Agent: Snapchat 3.0 rv:3.0.0 (iPhone; iPhone OS 5.1.1; en_US)
    Content-Length: 32
    Content-Type: application/x-www-form-urlencoded; charset=utf-8
    Accept-Encoding: gzip
    Connection: close
    Proxy-Connection: close

    u=<user>&t=<password>&a=login

This will return JSON containing couple useful things:

1. The session token, which is required for all other calls.
2. A list of images that haven't been viewed yet (the "id" field being the most important).

Once the returned JSON is parsed, the rest is just making calls to the `blob` API - this is the API that actually returns the image data (as a JPG), and can then be saved to disk. The URLs to retrieve an image look like this:

    https://feelinsonice.appspot.com/blob?u=<user>&t=<session-token>&i=<image-id>

This allows images to be easily downloaded, without them being removed.

###How it normally works...

In the mobile application, a call to the `ss_pa` API is made when an image is viewed, this removes the image - and once this is called, there doesn't seem to be a way to get the image back.

    POST https://feelinsonice.appspot.com/ss_pa HTTP/1.1
    Host: feelinsonice.appspot.com
    User-Agent: Snapchat 3.0 rv:3.0.0 (iPhone; iPhone OS 5.1.1; en_US)
    Content-Length: 102
    Content-Type: application/x-www-form-urlencoded; charset=utf-8
    Accept-Encoding: gzip
    Connection: close
    Proxy-Connection: close

    u=<user>&t=<session-token>&v_str=%7B%22<image-id>%22%3A%22<unix-timestamp>%22%7D

This API call is the key to keeping the image from being accessed again. If a client didn't implement this API, it would allow users to access the images any time they like - completely bypassing the entire point of the application.

###Other APIs

Here are some of the other APIs used:

* `ss_refresh` - pull the list of images (this API returns a subset of what's returned by `ss_auth`)
* `nsp` - uploads an image
* `clear` - clears the user's history
* `auth` - used to destroy the session, not to be confused with `ss_auth`

All of these are easily understood and implemented. There are other APIs, for things like registration that I didn't look into, as they are beyond the scope of this research.

###Unofficial clients

With such a simple API I'd be amazed if other, unofficial, clients didn't start turning up - with saving images being their primary feature. A crappy but functional Android client that supports saving could be built in a couple hours.

For now I'm not making any proof-of-concept code available, as I believe that this article makes it sufficiently clear how easy it is to write an unofficial client for this service that allows images to be saved. The goal here isn't to exploit this hole, but to point out the risk of untrusted clients.

###Overall

Session management is fairly well done - and would certainly make unofficial clients that aren't full-featured less attractive due to needing to login so often; but this certainly doesn't provide any protection. The API itself seems to have no protection against untrusted clients, making it trivial to save images or perform other unintended actions.

I did contact the authors to suggest that they encrypt the image data when it's sent to the client, making it harder to get the data without reverse engineering the application. It wouldn't stop everyone, but it would make the task less trivial.

Given the nature of the application, I suspect unofficial clients are unavoidable though - especially as the service grows in popularity (as I expect it will once the official Android client is released).
