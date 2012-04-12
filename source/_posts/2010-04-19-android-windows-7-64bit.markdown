---
date: '2010-04-19 01:13:56'
layout: post
slug: android-windows-7-64bit
status: publish
title: Android & Windows 7 64bit
wordpress_id: '572'
categories:
- Software
tags:
- Android
- Development
- Google
- Java
- Programming
- Software
- Software Development
- Tips and Tricks
---

Setting up the Android SDK on Windows 7 64bit, with a 64bit JDK / JRE is a bit less straightforward than one would expect, thankfully though the solution is quite simple. There are two settings that need to be adjusted to make this work - otherwise you'll get an error indicating that Java can't be found.

Step 1: Modify your `PATH` to include the `bin` folder of the JRE. Mine looks like this:


`C:\Program Files\Java\jre6\bin`


Step 2: Set the `ANDROID_SWT` variable (you'll probably need to add it) to the `\tools\lib\x86_64` folder of the Android SDK. Mine looks like this:


`C:\Android\SDK\tools\lib\x86_64`


With these two changes, everything seems to work as expected. Why this is required on 64bit but not 32bit I'm not sure, but this does seem to solve the problem.
