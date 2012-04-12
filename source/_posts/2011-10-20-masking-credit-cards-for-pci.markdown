---
date: '2011-10-20 16:14:40'
layout: post
slug: masking-credit-cards-for-pci
status: publish
title: Masking Credit Cards for PCI
wordpress_id: '1004'
categories:
- Code Samples
- Development
- Technology
tags:
- .NET
- Development
- PCI
- Security
- Software Development
- Tips and Tricks
---

PCI DSS, the security standard for companies that handle credit cards, defines a number of [rules](https://www.pcisecuritystandards.org/pdfs/pci_audit_procedures_v1-1.pdf) as to how credit cards are handled. One of those rules, 3.3, is defined as follows:


_Mask PAN when displayed (the first six and last four digits are the maximum number of digits to be displayed)_


So based on this requirement I assumed that the code to do this would be common and widely available; much to my surprise there are rather few samples that do this, and of those I found they only showed the last four (which when you are handling a lot of credit cards, searching for an account by the last four isn't all that helpful) and were often rather fragile.

So I whipped this up, hopefully it'll be useful to others.

{% gist 1674453 %}

The regex pattern is from [Regular-Expressions.info](http://www.regular-expressions.info/creditcard.html) and should detect most major cards.
