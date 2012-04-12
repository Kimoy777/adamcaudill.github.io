---
date: '2006-09-24 23:15:01'
layout: post
slug: eventargs-no-need-to-pass-a-new-instance
status: publish
title: 'EventArgs: No need to pass a new Instance'
wordpress_id: '114'
categories:
- Development
- Software
---

If you look at the code I write, seeing a line similar to the following would be fairly common:

`RaiseEvent LoadComplete(Me, New EventArgs)`

Yesterday, I wouldn't have given this a second thought, but today, the story is a bit different. A friend of mine pointed me to an [interesting comment](http://msdnwiki.microsoft.com/en-us/mtpswiki/118wxtk3(vs.80).aspx#CommunityContentAnchor)  by [David Kean](http://davidkean.net/)  (from Microsoft) on the [MSDN Wiki](http://msdnwiki.microsoft.com/en-us/mtpswiki/default.aspx)  indicating that the line above is actually _wrong_!

So, based on his comment, I should be using [EventArgs.Empty](http://msdn2.microsoft.com/en-us/library/system.eventargs.empty.aspx)  instead of creating a new instance, something like this:

`RaiseEvent LoadComplete(Me, EventArgs.Empty)`

So using `EventArgs.Empty` must be better somehow, so I decided to take a look and see if I could figure out just what the difference would be. The MSDN states that "_The value of Empty is a read-only instance of EventArgs equivalent to the result of calling the EventArgs constructor_" - so what's the difference? Time for a trip into the [Reflector](http://www.aisto.com/roeder/DotNet/).

The Reflector shows two constructors:

`Public Sub New()  
End Sub`  
  
`Shared Sub New()  
EventArgs.Empty = New EventArgs  
End Sub  
`

So, `EventArgs.Empty` just calls `New EventArgs` and returns that. _Right_.

Anybody see something there that I'm missing? Seems to me that the somewhat more verbose, but more clear (as to what is actually happening) syntax would be better, and no less efficient. If anybody has an opinion about why you would do one instead of the other, I'd like to hear it.  

