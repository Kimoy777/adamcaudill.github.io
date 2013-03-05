---
layout: post
title: "Evernote: Doing it (mostly) right"
date: 2013-03-02 18:29
comments: true
categories: 
---

*(Update: See [here](http://arstechnica.com/security/2013/03/critics-substandard-crypto-needlessly-puts-evernote-accounts-at-risk/) for more information about what they did wrong, including a vulnerability I found in the password handling of the Android app.)*

So the big news today is [Evernote being popped](http://evernote.com/corp/news/password_reset.php); with 50m users and user base that often stores sensitive material - it certainly is a tempting target for many reasons.

{% tweet https://twitter.com/evernote/status/307882426129055744 align='center' %}

CNET was able to [get a quote](http://news.cnet.com/8301-1009_3-57572212-83/online-note-service-evernote-latest-firm-to-get-hacked/) from Evernote on the issue, providing some extra insight compared to what's in their announcement:

{% blockquote Evernote Representative, CNET %}

Our operations and security team caught this at what we believe to be the beginning stages of a sophisticated attack. They are continuing to investigate the details. We believe this activity follows a similar pattern of the many high profile attacks on other Internet-based companies that have taken place over the last several weeks.

{% endblockquote %}

But there's plenty being written about the hack - what I'm more interested in is the response. Let's take a look at what's happened (publicly, at least):

*Feb 28th:* Evernote's Operations & Security team notices potentially malicious activity.

*This Morning:* User's started noticing that the client stopped syncing, complaining of a password issue. If a user logs into the web interface, they are prompted to set a new password.

*10:57AM EST:* Evernote posted a blog post and linked to it on Twitter (see above); within a few minutes their blog was returning a database connection error. Later visiting the blog returned a maintenance page, a database error, or a 503 error.

*11:57AM EST:* Evernote posted a new link and redirected the original blog post.

*1:45PM EST:* Received email notifying of incident and password reset. As this email was sent to ~50m users, it's to be expected that there's a large window during which users received it.

*What's not happened yet:* Despite several requests from different people, they have yet to release any technical information on how the passwords were stored, beyond that they were hashed & salted.

**What's Right & What's Wrong**

*Two days from finding issue to notifying users* - I've seen some people complain about this delay, but given that the priority is stopping the attack first, and the need to capture evidence as quickly as possible to give the best chance of understanding just what happened - I'd call this quite reasonable. Compared to some other companies that waited weeks or even months, I'd say they got this one right.

*User notification* - This is a hard one, on one hand you have the need to secure accounts as soon as possible while on the other, is letting users know why they are being required to change their password. I wish they had been able to get the email notification out sooner, but it was more important that they secure the accounts.

Because of the delay in notifying users, it's possible for some users to change their password and go on with their day without knowing why they needed to change the password - or that if they use that same password elsewhere it needs to be changed there as well. They should have made what happened clear when changing the password.

Now, the email itself deserves to be called out - it's known that the email addresses where in the stolen data, so emails claiming to be from Evernote require an extra look to make sure they aren't phishing. Evernote, to add to the confusion, made a huge mistake: the links in the email don't go to `evernote.com` - they go to `links.evernote.mkt5371.com/ctt?...`. That raises a few red flags...

*The blog post* - I love WordPress, but it's not always the best choice when you are expecting *lots* of traffic. They really should have hosted the notice from a static page from the beginning instead of trying to keep WordPress up under that much pressure.

*The password reset process* - To reset the password, all you had to do was login with the existing password to the web site - the same password that was just stolen. No proof of identity at all. If the attackers were able to crack the hashed passwords, they could easily change the password themselves and access the account. 

This really should have been done better.

*Disclosing technical details of password storage* - As I stated above, this hasn't happened despite numerous requests. While researchers need to know this to understand the risks of the passwords being cracked, unfortunately it's possible that this information could help the attackers if they weren't able to acquire source code that reveals the inner workings of their password handling.

For example, if the attack vector was SQL injection, it's possible to exfiltrate the data without being able to get to code. 

**Overall**

It seems that they have handled this responsibly as possible; this isn't the kind of event anybody is truly prepared for. Could it have been done better? Yes, in a few ways - but they could have done so much worse.

It could be argued that in the grand scheme, [they don't care about security](http://markpercival.us/post/44391805072/evernote-doesnt-really-care-about-security) - from my experience, that's the impression I've gotten.
