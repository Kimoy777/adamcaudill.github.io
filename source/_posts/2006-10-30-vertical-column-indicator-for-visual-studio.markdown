---
date: '2006-10-30 20:55:08'
layout: post
slug: vertical-column-indicator-for-visual-studio
status: publish
title: Vertical Column Indicator for Visual Studio
wordpress_id: '132'
categories:
- Development
- Software
tags:
- .NET
- Development
- Programming
- Visual Studio
---

The coding guidelines at my job have a rather interesting requirement: code must be wrapped at 100 characters. If you fail to meet this on any line of code, you fail the code review. In the year I've worked at this company I've learned to guess how long a line is quite well. As of today, no more guessing.

Here's a quick registry hack to add a vertical line in the editor at any column you wish, just double click the [REG file](http://adamcaudill.com/files/2006/10/vscolumnline.zip) and you're set. The contents of the file look something like this:

    Windows Registry Editor Version 5.00
    
    [HKEY_CURRENT_USER\Software\Microsoft\VisualStudio\8.0\Text Editor]
    "Guides"="RGB(128, 128, 128) 100"
    
    [HKEY_CURRENT_USER\Software\Microsoft\VisualStudio\7.1\Text Editor]
    "Guides"="RGB(128, 128, 128) 100"`

The setting works something like this: The `RGB()` part defines the color of the line, the number at the end defines the column the line is displayed at. If your style defines a limit on the length of a line, this is a great way to see at a glance if you're going too long.

_Note:_ This adds the key for both Visual Studio 2003 and Visual Studio 2005.

**Update:** The original REG file I linked to had a formatting error that caused the data to import improperly. I've replaced the file with a working copy.
