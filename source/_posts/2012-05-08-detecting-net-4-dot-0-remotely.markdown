---
layout: post
title: "Detecting .NET 4.0 Remotely"
date: 2012-05-08 03:47
comments: true
categories: 
---

While preparing to deploy an internal application I started to wonder if all of the workstations were properly configured - after a quick search I found a number of methods for detecting the .NET framework locally, but I didn't find any clean options that worked remotely.

Thankfully I found a post with a few [detection methods](http://skatterbrainz.blogspot.com/2011/05/assorted-ways-to-detect-net-40.html), one of which was using [WMI](https://en.wikipedia.org/wiki/Windows_Management_Instrumentation) from VBScript - which gave me the inspiration I needed:

{% codeblock %}
strComputer = "."
Set objWMIService = GetObject("winmgmts:\\" & strComputer & "\root\CIMV2")
Set colItems = objWMIService.ExecQuery( _
    "SELECT * FROM Win32_Product WHERE Caption LIKE '%.NET Framework 4%'",,48)
For Each objItem in colItems
    Wscript.Echo "Caption: " & objItem.Caption
Next
{% endcodeblock %}

I pulled up [LINQPad](http://www.linqpad.net/) and whipped up a quick script to check for both the Client Profile and full (extended) version on a list of computers. Hopefully it'll be of some use others.

{% gist 2631085 %}

One thing to note, is that you do need Administrator permissions on the remote workstations.
