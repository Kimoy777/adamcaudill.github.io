---
layout: post
title: "Detecting .NET 4.0 Remotely"
date: 2012-05-08 03:47
comments: true
categories: 
---

While preparing to deploy an internal application I started to wonder if all of the workstations were properly configured - after a quick search I found a number of methods for detecting the .NET framework locally, but I didn't find any clean options that worked remotely.

Thankfully I found a post with a few [detection methods](http://skatterbrainz.blogspot.com/2011/05/assorted-ways-to-detect-net-40.html), one of which was using [WMI](https://en.wikipedia.org/wiki/Windows_Management_Instrumentation) from VBScript - which gave me the inspiration I needed:

```vbnet
strComputer = "."
Set objWMIService = GetObject("winmgmts:\\" & strComputer & "\root\CIMV2")
Set colItems = objWMIService.ExecQuery( _
    "SELECT * FROM Win32_Product WHERE Caption LIKE '%.NET Framework 4%'",,48)
For Each objItem in colItems
    Wscript.Echo "Caption: " & objItem.Caption
Next
```

I pulled up [LINQPad](http://www.linqpad.net/) and whipped up a quick script to check for both the Client Profile and full (extended) version on a list of computers. Hopefully it'll be of some use others.

```csharp
void Main()
{
  //read the list of computrers to hit from computers.txt
  var path = Path.Combine(Environment.GetEnvironmentVariable("USERPROFILE"), 
    @"Desktop\computers.txt");
  var computers = File.ReadAllLines(path);
  
  //use a parallel searh as this process is quite slow
  Parallel.ForEach (computers.Where(s => !string.IsNullOrWhiteSpace(s)), comp =>
  {
  	try
	{
	  bool extended = false;
	  bool client = false;
	
	  var search = new ManagementObjectSearcher(string.Format(@"\\{0}\root\cimv2", comp),
	    "SELECT * FROM Win32_Product WHERE " + 
	    "Caption = 'Microsoft .NET Framework 4 Client Profile' " +
	    "OR Caption = 'Microsoft .NET Framework 4 Extended'");
	
	  foreach (ManagementObject res in search.Get())
	  {
	    if (res.Properties["Name"].Value.ToString() == "Microsoft .NET Framework 4 Client Profile")
	      client = true;
	  
	    if (res.Properties["Name"].Value.ToString() == "Microsoft .NET Framework 4 Extended")
	      extended = true;
	  }
	
	  Console.WriteLine(string.Format("{0}: Client: {1}; Extended: {2}", comp, client, extended));
	}
	catch (Exception ex)
	{
	  Console.WriteLine(string.Format("{0}: Failed ({1})", comp, ex.Message));
	}
  });
}
```
One thing to note, is that you do need Administrator permissions on the remote workstations.
