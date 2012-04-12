---
date: '2007-10-09 01:15:44'
layout: post
slug: switching-to-gmail-again
status: publish
title: Switching to Gmail, Again
wordpress_id: '191'
categories:
- News &#038; Events
- Personal
- Software
---

Once [again](http://adamcaudill.com/2007/02/06/from-outlook-to-gmail-to-the-bat/), I've decided to switch email clients; this time from [The Bat](http://www.ritlabs.com/en/products/thebat/) to Gmail, or more specifically, to [Google Apps](https://www.google.com/a/). After some recent issues with The Bat (mostly relating to a recent update), I decided to make another go at switching to Gmail; but this time trying the Google Apps version.

After my last attempt, I was [informed](http://adamcaudill.com/2007/02/06/from-outlook-to-gmail-to-the-bat/#comment-387) that the Google Apps edition of Gmail doesn't suffer the `Sender` issue that so plagued me before. After almost a full day of work, the transition is complete. And I couldn't be happier.

The only downside is the expense - all in all, it cost $78.95 to go through this process. This was spent on two tools that made the process possible:



	
  * [Aid4Mail](http://www.aid4mail.com/) - A key application used for converting the various mail-storage file formats.

	
  * [gMOVE](http://www.limitnone.com/products.php?p=gmove) - Used for importing PST files into Gmail.


The process itself was simple, once I had found the software I needed, which took some doing. Here's an overview, and some notes if you happen to try something like this (this assumes that you have Outlook installed).

	
  * Export messages to [mailbox](http://en.wikipedia.org/wiki/Mbox) format. (If you are moving from Thunderbird this isn't necessary as it already is stored in that format.)

	
  * Use Aid4Mail to convert the mbox files to PSTs

	
  * Load PSTs into Outlook and cleanup as necessary (remove duplicates, cleanup directory structure)

	
  * Launch gMOVE and use it to import the messages from Outlook to Gmail


There are a couple major differences in this attempt, compared to the last. A few things annoyed me about the way things worked after the last time, not the least of which is that by using [Gmail Loader](http://www.marklyon.org/gmail/) you loose all meaningful timestamps. So you don't know when a message was sent or received.

gMOVE eliminated that problem. It sends the messages to a special POP3 server, and automatically configures your Gmail account to use it. That way, they can control the timestamps, and set them to what they originally were 1.

So after all is said and done; I think I'm happy with this system; much better than last time. I simply can't justify using a desktop based email client anymore. It just leaves you too out of touch.


> 1). There is a security issue here, so I wouldn't do this with anything containing sensitive information.
