---
date: '2006-12-30 22:52:30'
layout: post
slug: iif-may-get-a-dose-of-legitimacy
status: publish
title: IIf() May Get a Dose of Legitimacy
wordpress_id: '159'
categories:
- Development
- Software
tags:
- .NET
- Development
- Microsoft
---

[Paul Vick](http://www.panopticoncentral.net/) announced a possible change for VB 9.0, [this change](http://www.panopticoncentral.net/archive/2006/12/29/18883.aspx) would give the [IIF method](http://msdn2.microsoft.com/en-us/library/27ydhh0d(VS.80).aspx) the legitimacy it has long deserved. The issue with `IIf` is that it's not a [short-circuit operator](http://en.wikipedia.org/wiki/Minimal_evaluation), which can severely limits its usefulness. Take the following example, that will throw an exception if `obj` is `Nothing`:


> `IIf(obj IsNot Nothing, obj.Property1, String.Empty)` 


Since `IIf()` is just a normal method, all parameters will be evaluated, regardless of weather `obj` is `Nothing`. This change would make `IIf` a true part of the language, a true ternary operator, instead of just another method.

`IIf` is largely avoided due to performance issues, and its limited usefulness for the reason above. Now that `IIf` _may_ function as a true operator (though still wrapped in the cloak of a method), it will be a truly useful part of the language, one that I've long wished for.  I've always been a fan of `IIf`, it'll be nice to be able to use it again, without the overheard and issues that has long went with its use.

Mr. Vick is still soliciting comments on this change, so now is the time to [make your opinion known](http://www.panopticoncentral.net/archive/2006/12/29/18883.aspx#FeedBack).
