---
date: '2007-02-06 23:53:38'
layout: post
slug: from-outlook-to-gmail-to-the-bat
status: publish
title: From Outlook, to Gmail, to The Bat!
wordpress_id: '178'
---

Back in March, I [switched](http://adamcaudill.com/2006/03/22/move-to-outlook/) from [The Bat!](http://www.ritlabs.com/en/products/thebat/) to Outlook as a result of being annoyed with using two different clients (work & home)*. So today, I'm running The Bat again, thanks to [Gmail.](http://gmail.google.com/)

**Moving to Gmail**

I had been thinking about moving to Gmail for a while, the other day I decided to bite the bullet and do it. There was some pain involved, but not as bad as I expected. The process goes something like this:
	
1. Setup any [custom From address](http://mail.google.com/support/bin/answer.py?answer=20616), personally, I had 5. _Now, here's a word of warning:_ pay close attention to the note on that page, I didn't, and it bit me quite hard, [here's why](http://pascal.vanhecke.info/2005/08/31/gmail-sender-header-makes-custom-from-address-useless-for-mailinglists/).

2. Setup [Filters](http://mail.google.com/support/bin/answer.py?answer=6579) to [Label](http://mail.google.com/support/bin/answer.py?answer=6560) your email based on the `To` address, this way you can see what account a message was sent to.

3. Forward your existing email account to <your_name>@gmail.com.

4. Convert/Export your email to the [mbox format](http://en.wikipedia.org/wiki/Mbox) (some clients such as Thunderbird support this natively), for some clients, you may need the help of something like [Aid4Mail](http://www.aid4mail.com/) (this is what I used, works great).

5. Finally, use Mark Lyon's [Gmail Loader](http://www.marklyon.org/gmail/) to read the mbox files you just created, and shoot them to your Gmail account. One note on this, it sends one email every two seconds, assuming no errors, so if you have several thousand emails, this is a slow process.

Once you've completed those 5 steps, you're done.

Now, there are some things to keep in mind, if you don't want people to see your Gmail address via that custom From address, well, you're out of luck. Google sends a `Sender` header with your Gmail address. This results in a number of issues, but the most painful for me was in Outlook displaying something like this:

> _"From <you>@gmail.com on behalf of <you>@example.com"_

As far as I'm concerned, that's about the most unprofessional thing a business email could display. It reeks of uncaring attitudes and oozes the impression of fraud. I use my email for business, so that isn't an option.

Thankfully, I noticed this before it caused too much embarrassment, but it's a death-nail for any user that needs mobile business email.

**Moving to The Bat!**

Thankfully I was only using Gmail full-time for around a day, so I don't have to fight the battle of getting my email back from Google**. Thanks to the import features of The Bat, I moved my 15,000 or so emails over from Outlook 2007 in less than an hour. All told I spent around 50 hours importing email, setting up filters and cleaning up on Gmail; for The Bat!, that same task took less than three hours, and that includes setting up several fairly complex filters.

After a year using Outlook 2007 and Outlook 2003, then one whole day with Gmail as my primary mail client, I'm glad to be back with The Bat!. The lag that so annoyed me with Outlook is finally gone. Everything it does is fast.

I wanted a real web-based solution, and the best candidate failed. Now I'm back to a desktop client, but one that offers better performance and more flexibility than Outlook can provide.

* Truth be told, I believe I was just frustrated with the lack of flexibility that Outlook has compared to The Bat!, and since I couldn't avoid Outlook, I axed The Bat.

** Has anyone noticed that Gmail has no easy or even reasonable way to get your email out of the system? Locking users in seems odd for a company that promises to [not be evil](http://en.wikipedia.org/wiki/Don't_be_evilhttp://en.wikipedia.org/wiki/Don't_be_evil).
