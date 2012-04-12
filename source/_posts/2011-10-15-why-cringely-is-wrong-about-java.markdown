---
date: '2011-10-15 15:47:52'
layout: post
slug: why-cringely-is-wrong-about-java
status: publish
title: Why Cringely is wrong about Java
wordpress_id: '996'
categories:
- Business of Software
- Development
- Software
- Technology
tags:
- Development
- Java
- Microsoft
- Ruby on Rails
- Web Development
---

A couple of days ago I was sent a link to Robert Cringely's latest treatise:  _[The second coming of Java](http://www.cringely.com/2011/10/the-second-coming-of-java/)_ - and to say I disagreed was a bit of an understatement. To me, it represents a fundamental flaw in his perception of developers, and more importantly the economics of software development.

The key to Cringely's argument comes down to this:


When SSDs gain enough capacity there will be a shift from the Ruby world back to the Java world. Not for prototyping, because, well, it’s prototyping. But simply because the statement “**Ruby is _incredibly_ slow but I don’t care because my database is slower**” will no longer be true.


What he's missing here is the real reason people use frameworks like Rails; it's not about it being Ruby, or being the latest cool thing - it's about developer productivity. That's it, and that's all there is to it - Rails allows a developer to do more in less time. That's one of the key reasons so many Java web developers jumped ship (though I can think of a few others), and what pushed Microsoft to invest so heavily in their [MVC framework](http://www.asp.net/mvc).

I could fully rehash the argument, but in what I consider to be one of Jeff Atwood's best articles,  _[Hardware is Cheap, Programmers are Expensive](http://www.codinghorror.com/blog/2008/12/hardware-is-cheap-programmers-are-expensive.html)_, he covers a key point to my argument - developer time is vastly more expensive than hardware. Atwood's take on the issue is clear:


Clearly, **hardware is cheap, and programmers are expensive**. Whenever you're provided an opportunity to leverage that imbalance, it would be incredibly foolish not to.


When there's a choice between developer productivity, and spending money on hardware - the conclusion should be the same. It's much cheaper to throw more hardware at a slower framework than it is to invest more developer time in a faster framework. For any non-trivial application, throwing more front-end servers at it will always be cheaper than slowing the development process down with a non-productivity-centric toolkit.

It's simple economics; server hardware is getting faster and cheaper, developer time is only getting more expensive.
