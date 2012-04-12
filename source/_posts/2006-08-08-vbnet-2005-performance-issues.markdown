---
date: '2006-08-08 00:49:39'
layout: post
slug: vbnet-2005-performance-issues
status: publish
title: VB.NET 2005 Performance Issues
wordpress_id: '102'
categories:
- Development
tags:
- .NET
- Visual Basic
- Visual Studio
---

Seeing slowdowns in large VB 2005 projects? Well, I think I just found [the answer](http://www.panopticoncentral.net/archive/2006/08/03/13539.aspx). There's now a [QFE released](http://support.microsoft.com/kb/920805/en-us) that may help address these issues. One of the applications I maintain is a 25,000 line solution made up of 9 projects, I'm hoping this fix will resolve the issues we've seen compiling it (not to mention the frequent [compiler](http://www.paulstovell.net/Posts/Post.aspx?postId=5d7312bc-80fa-4ce3-b69e-12d55857d502) [ crashes](http://support.microsoft.com/kb/915038/en-us)).

Here's the list of symptoms addressed:



	
  * You experience a slow response time when you use single-step debugging. For example, the response time is slow when you press F10 to step into a line of code.

	
  * You experience a slow response time when the Error List or the Task List is updated by Visual Studio 2005.

	
  * You experience a slow response time when you use the IntelliSense feature.


Once I hear back from Microsoft support, I'll post details if it makes any difference.
