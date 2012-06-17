---
layout: post
title: "Monitor iPhone HTTP(S) Traffic with Fiddler"
date: 2012-06-10 14:10
comments: true
categories: 
---

For a research project I decided that I needed to monitor the traffic to and from my iPhone - both HTTP and HTTPS. Having had so much luck with Fiddler in the past, it was the first place I looked. There are a number of posts on this topic, but few that provide a clear and complete picture of what's needed. So I wrote one.

First, install the latest version of [Fiddler](http://www.fiddler2.com/fiddler2/version.asp), then install the iOS-compatible [certificate generator](http://www.fiddler2.com/dl/FiddlerCertMaker.exe). Now update the settings to decrypt HTTPS traffic:

{% img center http://adamcaudill.com/files/2012-06-10_1430.png %}

Next, update the settings to allow remote connections (make sure that restart Fiddler after this):

{% img center http://adamcaudill.com/files/2012-06-10_1433.png %}

Then export the Fiddler Root Certificate to your desktop from the options dialog:

{% img center http://adamcaudill.com/files/2012-06-10_1436.png %}

Email the `FiddlerRoot.cer` file to your iPhone - you'll need to import and trust the certificate to make this work. To install certificate, just click on the attachment and click the 'Install' button.

Now configure your iPhone to use the Fiddler proxy. The setting can be found at Setting -> Wi-Fi -> (your network) -> HTTP Proxy -> Manual. Set the 'Server' to the IP address of of your PC, then set 'Port' to 8888, and 'Authentication' to off.

You should now be able to see all of the HTTP and HTTPS traffic going across your phone. It's worth noting though, that some applications won't work while using the proxy - Twitter being one, though most work without issue.
