---
date: '2012-03-31 01:19:23'
layout: post
slug: my-5-minutes-of-infamy
status: publish
title: My 5 minutes of infamy
wordpress_id: '1095'
categories:
- Personal
- Security
- Technology
tags:
- GSuite
- Security
---

October 28, 2004 is a day I'll remember for the rest of my life.

I was coding away on the next version of a small product called GSuite that I was building for a tiny (and now nonexistent) software company called Imspire Software. It was a simple tool that provided some goodies for Gmail users, and had a few thousand users (it eventually died as a result of rapid API changes and new tools directly from Google). As I took a break to check my email, I saw something that shocked me:

{% gist 2259106 %}

[The full email is still [posted](http://osvdb.org/ref/11/11176-gsuite.txt) over at osvdb, and I make a point to go and look at it and the [details](http://osvdb.org/show/osvdb/11176) once a year or so - just to remind myself of what can happen.]

As I worked through the somewhat iffy English of the email I was in shock. I instantly understood the issue, I could see the code in my mind. It was written by another developer, and I could remember questioning its security - but I had other things I was supposed to be doing and didn't worry about it. What a mistake that was.

I went back to Visual Studio and found the code that caused it all:

{% gist 2258783 %}

Shifting values is obfuscation and little more, it looks like security - it might even smell like security, but it isn't. It's a false sense of safety, it was a mistake to implement and even more of a mistake to actually use in a consumer product.

While this is only a local information disclosure, and not something far more serious like a remote arbitrary code execution issue - it was still enough to really shake me. I had always considered myself to be a good developer, and part of that is writing secure code. This was many things - but secure isn't one of them.

Thankfully, [Lostmon](http://lostmon.blogspot.com/), the finder of the issue was courteous enough to give me a couple of days advance notice before making it public. Allowing me plenty of time to get a notice up on the web site, and get the next (fixed) version ready for release. I switched from a glorified [Caesar cipher](http://en.wikipedia.org/wiki/Caesar_cipher), to [Rijndael](http://en.wikipedia.org/wiki/Advanced_Encryption_Standard) - a significant step up I would say.

Was anybody harmed by this issue? I don't believe so - it was a relativity minor issue given what was needed to get the password. Was anybody impacted? Most certainly.



	
  * Users: They now wonder if they are secure - did somebody steal their information?

	
  * Company: The brand is weakened, less trusted, and questioned more.

	
  * Developers: Confidence is lost, self doubts start creeping in.


Because of this, every time I release an application I give much more thought to what I'm exposing and how it could be leveraged in an attack against my users. The only way I'll agree to an application release is if I'm completely certain that I'm not risking a user's security - if there are any unknowns, any doubts, then it's not worth the risk. Just that simple.
