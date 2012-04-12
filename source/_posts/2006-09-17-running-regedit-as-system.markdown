---
date: '2006-09-17 19:59:49'
layout: post
slug: running-regedit-as-system
status: publish
title: Running RegEdit as SYSTEM
wordpress_id: '111'
categories:
- Development
tags:
- Debugging
- Development
- Programming
- Software
- Tips and Tricks
- Windows
---

While facing an interesting research challenge, digging into the inner working of Windows, I realized that I needed to change a registry value. That's simple enough, I fire up RegEdit, make the change, then politely as RegEdit knows how, it told me that I _couldn't change the value_! Being one that hates when _my_ computer tells _me_ I can't do something, I had to find another option.

So after some research, I found my answer: [sc](http://www.microsoft.com/resources/documentation/windows/xp/all/proddocs/en-us/sc.mspx?mfr=true). This is a great little utility (included with Windows), and made the task of running an application as SYSTEM*  much easier. At this point some of you may be wondering why I didn't just use [RunAs](http://www.microsoft.com/resources/documentation/windows/xp/all/proddocs/en-us/runas.mspx?mfr=true) instead, as it's designed to allow execution as another user. Well, from all that I've found, there is no way to get RunAs to spawn a process as SYSTEM, one of the downsides of SYSTEM not being a true user.

Another option that I found (somewhat) attractive initially is [RunAsEx](http://www.codeproject.com/system/RunUser.asp), an open source, GUI based version of RunAs. This could be useful, but I found it to be more hassle than it was worth. Still might be useful for somethings, but with all the bugs I found in it, I knew there was a better way.

Now, back to the solution I chose: Using sc to create a service that will execute the application I'm after. This works because by default all services execute under the SYSTEM user context, so all we have to do is create a service to call the application we need. Surprisingly simple, and it works quite well.

Creating the service looks something like this:

`SC CREATE AcDebugSvc binPath= "regedit.exe" type= own type= interact` _**_

This creates the service, so that now all you have to do is start the service (`SC START AcDebugSvc` ***) and you'll see your copy of RegEdit. If you check in Task Manager, you'll be able to confirm that it is actually running as SYSTEM. This is an extremely powerful debugging tool, as it allows you to instantly execute any application as the most powerful user that Windows offers.

Once you are done with your work, just delete the service (`SC DELETE AcDebugSvc`) and call it a day, that simple. This can also easily be scripted if you tire of typing the commands so often, and it can also be used with most applications. Using this for the Command Prompt (`binPath= "cmd.exe /K start"`) and for Task Manager (`binPath= "taskmgr.exe"`) both strike me as being quite useful.

* **WARNING**: As I hope most of you know, System is a very powerful account, it's almost limitless in what it can do. If you aren't careful while working under this user context; you may end up with a rather expensive paperweight instead of a computer. You have been warned.

** Note: As odd as it is, the spaces after the equals and before the value of the parameters is quite important, the call will fail if you omit them.

*** Note: You'll get an error message ("`The service did not respond to the start or control request in a timely fashion.`") when you call this, it's nothing to worry about. The reason that it occurs is that to respond to the message it receives the target application must be designed to operate as a service. Since we are using this for other purposes we, we don't really care.
