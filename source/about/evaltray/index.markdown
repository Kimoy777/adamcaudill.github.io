---
date: '2006-02-25 18:29:34'
layout: page
slug: evaltray
status: publish
title: evalTray
wordpress_id: '8'
---

I've written a small utility that may be of some use to VB developers (or anyone familiar with VB or VBScript). This is basically a wrapper for the Microsoft Script Control's Eval method, the idea being to test simple lines of code or quick math tasks.  This simply executes VBScript code and returns either an error message if you made a mistake or the returned value.

This makes use of both the Microsoft Script Control to allow the execution of VBScript; as well .NET's ability to compile on the fly. This allows the user to execute code using either engine, depending on the task. VBScript is faster, though a more limited language while .NET is slowly, but offers the full power of the .NET Framework.

It's just a simple tool in a developers toolkit, but something you might find useful.

IMPORTANT: evalTray currently crashes when used on Windows 7. I am in the process of re-writing evalTray and will be posting an updated version soon.


### Changes


_2007.0.2.0 (Dec. 20, 2007)_



	
  * Major codebase cleanup.

	
  * Added support for VB.NET Code.

	
  * Now runs against the .NET Framework 2.0.

	
  * Corrected issue with Uptime function.

	
  * Changed data returned by OSVersion.

	
  * Google - Launches the default browser and performs a search on the string provided.

	
  * HostName - Returns the local PC name.

	
  * IPAddress - Returns a list of all IP addresses assigned to the local PC.

	
  * NSLookup - Return the IP address associated with the PC name specified.


_2006.0.1.81 (Feb. 26, 2006)_



	
  * ToBase64 - Encodes a string using the Base 64 algorithm.

	
  * FromBase64 - Decodes a Base 64 string.

	
  * Fixed Copy from Result window issue.

	
  * Parameters are now automatically formatted.


_2005.0.1.53  (Sept. 29, 2005)_



	
  * "exit" exit's the application

	
  * "close" closes the window

	
  * Alt+F3 opens the code window

	
  * "uptime" returns the current system uptime.


_2004.0.2.49 (Oct. 6, 2004)_



	
  * More robust error handling.

	
  * Added F4 hot-key. Inserts: ("")

	
  * MB - One argument wrapper for MessageBox.Show

	
  * HtmlEncode

	
  * HtmlDecode

	
  * UrlDecode

	
  * UrlEncode

	
  * UrlPathEncode

	
  * ShellEx

	
  * SCrypt - Simple value-swapping encryption.

	
  * AsciiToHex

	
  * HexToAscii

	
  * MD5

	
  * SHA1

	
  * CRC32


_2004.0.1.35 (Oct. 4, 2004)_



	
  * DNSResolve - Resolve a domain name to a IP address. Sample: dnsresolve("www.google.com")

	
  * OSVersion - Returns the version number of Windows.

	
  * TickCount - Retrieves the system tick count.

	
  * SysDir - Returns the path of the System folder.

	
  * Enviro - Expands environmental variables. Sample: enviro("%SystemRoot%")

	
  * CLR - Returns the runtime version number.


_2004.0.0.24 (Oct. 3, 2004)_



	
  * Initial Release




### Support


I'll do my best to support this as my time allows. I'd also like to hear your feedback, comments, feature requests, or anything else you feel like saying. [Contact me](mailto:adam@adamcaudill.com).


### Download


Requirements:



	
  * .NET Framework 2.0

	
  * A Computer


[Mirror 1
](http://www.adamcaudill.com/files/evalBarInstall.exe)
