---
layout: post
title: "Cryptocat: What is the measure..."
date: 2013-07-16 19:05
comments: true
categories: 
---

What is the measure of a man; what makes one great, and another lesser? What separates success from failure? We all recognize light from dark, but at which point does it go from one to another? If we ask if a person (or company, or product) is successful - do we measure them against their closest competitor, their nearest neighbor, or perhaps the most successful person we know? Where, and how, do you set that bar to measure against?

Yesterday I talked to [Nadim Kobeissi](http://nadim.cc/) for about an hour about Cryptocat, its policies, practices, successes, failures, and goals. The topic of goals led to an interesting discussion - to what standard is Cryptocat being held? Perhaps, just perhaps - the unforgivable security failures of Cryptocat are only so unforgivable because of the bar it's being measured against.

{% blockquote %}
[this] is a crucible; in it we burn away irrelevancies until we are left with a pure product: the truth, for all time.
{% endblockquote %}

So, what it the true goal? Here is a snippet of their [readme](https://github.com/cryptocat/cryptocat/blob/master/README.md), which (kinda) lays out the goal:

    Cryptocat is an experimental browser-based chat client for easy to use, encrypted conversations. 
    It aims to make encrypted, private chat easy to use and accessible. We want to break down the 
    barrier that prevents the general public from having an accessible privacy alternative that 
    they already know how to use. Cryptocat is currently available for Chrome, Firefox and Safari.

The second sentence is the one that I find interesting, in light of the conversation I had yesterday; primarily this part: *an accessible privacy alternative that they already know how to use*. I asked Nadim at one point what his goal was, he responded without hesitation: to provide a safer alternative to Facebook Chat, Google Talk, etc.. 

When I asked about Cryptocat's reputation as a tool for activists, he was clearly agitated and made his position on the matter very clear. That isn't the intention, and he acknowledged that it's not safe for that use. He then pointed me to a [quote on their blog](https://blog.crypto.cat/2012/11/security-update-a-follow-up/):

{% blockquote %}
We have realized that due to some (perhaps well-meaning) media coverage of the Cryptocat Project, our work has been labeled by the media as something that can aid activists in overthrowing governments or help save someone’s life. This is not what Cryptocat is, it is wrong for the media to say that, and we have never said anything to that effect ourselves.
{% endblockquote %}

Though I will note, the initial feeling seemed to be a bit different:

{% tweet https://twitter.com/cryptocatapp/status/228921660324061184 align='center' %}

**So, where does this leave us?**

The [most recent flaw](http://tobtu.com/decryptocat.php) was bad, very, very bad. *If* you understand encryption, the protection afforded was far less than expected. Let's look at it from another perspective though: Compared to Facebook Chat. While the bug was bad, how does it compare to other consumer chat systems, even with that flaw in mind? From what I've seen, it's still a better option than Facebook.

First, let's ignore encryption and just look at what we get from SSL/TLS:

[Facebook](https://www.ssllabs.com/ssltest/analyze.html?d=facebook.com&s=173.252.110.27):

{% img center /files/Qualys_SSL_Labs_-_Projects___SSL_Server_Test___facebook.com.png %}

[Cryptocat](https://www.ssllabs.com/ssltest/analyze.html?d=crypto.cat):

{% img center /files/Qualys_SSL_Labs_-_Projects___SSL_Server_Test___crypto.cat.png %}

First thing that I can point out is the use of [forward secrecy](https://community.qualys.com/blogs/securitylabs/2013/06/25/ssl-labs-deploying-forward-secrecy) - something Facebook isn't using ([yet](http://news.cnet.com/8301-13578_3-57591179-38/data-meet-spies-the-unfinished-state-of-web-crypto/)). So, if you just look at SSL/TLS, Cryptocat is better - assuming nobody else has access to the ciphertext, which [happened](https://blog.crypto.cat/2012/11/security-update-our-first-full-audit/) (at least) when they used Cloudflare.

How about data retention? While in the past Facebook has said messages are [cleared after 90 days](http://news.cnet.com/8301-13577_3-9896860-36.html), it's not clear how long they retain the information today, or how much could be produced under subpoena - it's clearly more than what [Cryptocat can](https://blog.crypto.cat/2013/05/responding-to-law-enforcement-requests/) produce (as Facebook [produces a lot](http://info.publicintelligence.net/Facebook2010.pdf)). Just looking at what Facebook can provide, versus what Cryptocat can says a lot from a privacy perspective.

I could go through more details, or compare it in more detail to other services, but the basic point should remain.

From that perspective, I think Cryptocat has accomplished something - it may not be ideal, and has clearly been far from it; it's still a better choice for casual communication than most (all?) of the major IM/chat players.

**'I thought you said don't use it?'**

In an [article](http://arstechnica.com/security/2013/07/bad-kitty-rooky-mistake-in-cryptocat-chat-app-makes-cracking-a-snap/) I was quoted as saying something like this:

{% blockquote %}
He went on to recommend people not rely on Cryptocat to keep their conversations private until the code and the cryptography in it are thoroughly audited by professional penetration testers and cryptographers.
{% endblockquote %}

I stand by that statement. If you *need* security, Cryptocat isn't what you should be using, period. If you *want* privacy, it's not a bad option. In a discussion on Twitter, the agreement was that there are no real competitors that provide secure multi-party chat - for those that want that feature, Cryptocat seems to be the only option.

It's worth pointing out though, if you're reading this, you probably know how to use PGP - and can use that to get around Cryptocat's use-case. I'm not an apologist, and I'm not trying to excuse serious mistakes - I'm trying to present the issue, and the system itself in a fair light for the intended use-case, as Nadim explained it. In that light, the system still achieves its basic goal.
