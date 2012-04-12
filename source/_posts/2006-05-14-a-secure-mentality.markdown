---
date: '2006-05-14 12:01:25'
layout: post
slug: a-secure-mentality
status: publish
title: A Secure Mentality
wordpress_id: '66'
categories:
- Development
tags:
- ISO 17799
- Security
- Software Development
---

My employer recently completed the final audit to confirm ISO 17799 compliance, the process was a real eye opener. In a process that should have been fairly short & painless, the ordeal lasted close to a year, with me joining the company just before the second, and largest audit. That made my first few weeks rather _interesting_, to say the least.

While 17799 does have some complex requirements, most of the issues found had more to do with the overall mentality than with the true technical issues involved. The mentality at work tends to be to not seek what's secure, but to find what works, and what's fast - regardless of its impact. Without always being aware of the security issues involved, it's easy to introduce significant vulnerabilities into a system.

There are three primary groups of thought when it comes to security:



	
  1. **Those that don't know or care.
**In the business world, these are by far the most common users, they don't understand the implications and they typically want to keep it that way. These users introduce an amazing number of issues into a system.

	
  2. **Those that know, but don't care enough to do things right.**
These are less common, though they pose an equal, if not greater risk. When the pressure to have tasks done in an extremely short time is high enough, security shortcuts are often the result. While it typically doesn't add significantly to time-lines, there is a time cost to ensuring that proper processes are followed.

	
  3. **Those that put security first.**
This is the smallest group, though when equipped with the proper authority, can have the greatest impact. These rare people who both understand and care tend to carry the burden for the ignorance and laziness of the other major groups. It is there duty to see that data is secure, and systems are well protected against possible attacks.


Keeping a constant eye on security is critical, especially for developers - as our work can have an impact on such a large number of end users. Many developers tend to under-appreciate the impact they can have, both for the good their work does, and the harm their mistakes can cause. Finding a clear understanding of the implications of a decision is vitally important.

Even if you think something may not raise a security issue, take the time to evaluate the possibilities. Its well worth the time, trust me, [I know this](http://securitytracker.com/alerts/2004/Oct/1011994.html). A single error on my part as to how the application needed to secure its data led to a public announcement of the issue to the famous BugTraq mailing list. A simple mistake, with a definite impact on how I view potential security issues.

Thankfully that issue was small enough that it didn't cause any real harm, but it certainly taught me a lesson. In that decision, I didn't consider the possible implications, it led to what I consider a rather public embarrassment.

Next time you work on a feature that could be abused in any way, take a few minutes to think about ways to make it safer and more secure. You'll thank yourself later.
