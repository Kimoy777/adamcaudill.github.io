---
date: '2010-06-18 23:42:05'
layout: post
slug: upgrading-windows-7-pro-vl
status: publish
title: Upgrading Windows 7 Pro VL
wordpress_id: '600'
categories:
- Software
- Technology
tags:
- Microsoft
- MSDN
- Tips and Tricks
- Windows
- Windows 7
---

While performing some testing on a Windows 7 Professional workstation running a VL build from MSDN I found that a feature I needed was missing - the new [Multi-Monitor RDP](http://blogs.msdn.com/b/rds/archive/2009/07/01/using-multiple-monitors-in-remote-desktop-session.aspx) support. After a little [research](http://windows.microsoft.com/en-us/windows7/Remote-Desktop-Connection-frequently-asked-questions#) I found that only the Ultimate and Enterprise editions support this feature; which thanks to Windows 7's [Anytime Upgrade](http://en.wikipedia.org/wiki/Windows_Anytime_Upgrade) feature I assumed this would be no issue.

But, it was an issue.

It turns out that the build of Windows 7 I was using was missing `WindowsAnytimeUpgradeUI.exe` and the other related files needed to make the Anytime Upgrade work - and copying the files from another box doesn't work. It seems this build simply can't be upgraded in this fashion. So I tried a few other tricks, hoping to find something that would work:



	
  * Reactivate Windows with an Ultimate key; fails with an error indicating that a Professional key is required.

	
  * Run Ultimate edition installer from Windows; fails with [this error](http://adamcaudill.com/files/2010-06-18_0332.png) indicating that you can't perform edition upgrades.


So being stubborn and determined not to re-install Windows to make this feature work, I started looking for other options. Thanks to a hack for [upgrading the RC builds to Final](http://www.gmtaz.com/how-to-upgrade-windows-7-rc-ultimate-to-rtm-enterprise/comment-page-1/), I found what I needed.

I edited the `EditionID` and `ProductName` to reflect Ultimate instead of Professional, rebooted, and then ran the Ultimate installer from within Windows. This time the installer ran without issue and after an hour and a couple reboots it was done. This in-place upgrade/repair procedure allows you to jump to a different edition with fairly little pain. A couple of Windows settings needed to be corrected (primarily display related) and Visual Studio 2010 had to be re-installed, though otherwise everything worked just as it did before.

This is the only method for upgrading these Windows 7 builds that I've found, the only other option is to re-install Windows from scratch.
