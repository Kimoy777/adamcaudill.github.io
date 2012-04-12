---
date: '2012-01-26 12:58:28'
layout: post
slug: iin-bin-database
status: publish
title: IIN (BIN) Database
wordpress_id: '1087'
categories:
- Software
---

An [Issuer Identification Number](http://en.wikipedia.org/wiki/ISO/IEC_7812) (IIN, more commonly called a BIN) is the first 6 digits of a credit or debit card, and it identifies the bank that issued it - and if you want to know if a number is a real credit card or just a bunch or random digits, it's a huge help. While credit card numbers do use the [Luhn algorithm](http://en.wikipedia.org/wiki/Luhn_algorithm) (mod 10 check) to see if the number is valid, it still produces a huge false-positive rate.

For an application like [ccsrch](https://github.com/adamcaudill/ccsrch), having this data available would be very handy to reduce false positives when scanning a large file system (scanning a large server produces a huge number of possible hits), but for what I would call fairly misguided reasons, the official registrar of these numbers (the [ABA](http://www.aba.com/default.htm)) doesn't make this data publicly available. As a result many people have pulled together what data they could find and made it freely available.

So I'll add my name to that list.

I've pulled data from many public sources (sorry, I didn't keep very good notes as to the sources) and cleaned it up to a reasonable point. All told, I've probably spent 40 hours or more cleaning this data up and getting it to a usable state. It contains over 60,000 entries, including major credit cards (Visa, MasterCard, Amex, Discover) as well as a few merchant entries.

Each record contains the following:



	
  * IIN

	
  * Type (Mastercard, Visa, Visa Credit, etc.)

	
  * Name (Issuer name)

	
  * Length


**Data Quality**

It's not perfect. It's from public sources so there may be errors, and there are some duplicates from cases where I wasn't able to determine who the IIN actually belongs to. I've also updated for name changes and mergers where possible, but I'm sure I've missed a few and there are some where the assets where split, so I don't know who the correct owner actually is (Washing Mutual being the leading example of this).

In general, I leaned to the side of caution - so if I didn't know for sure, I left the duplicate in.

If you need absolutely correct data - contact the ABA, they are the only source that can give you the completely accurate listing. If you need to have a decent idea if a number is valid for most cases - I would say that this data is good enough.

**Warranty**

Just to make it really, really, really clear: There is no guarantee that this data is accurate, that it won't cause to lose your job, cause your house to burn down, or cause Rebecca Black's [Friday](http://www.youtube.com/watch?v=kfVsfOSbJY0) to get stuck in your head (yup, you're welcome ;)).

**Copyright**

Based on my understanding of US copyright law, it is my understanding that this data is not subject to copyright as it is a compilation of facts and doesn't constitute an original expression. Thus, to the best of my knowledge, this data is in the public domain.

**Download**

[Here](http://adamcaudill.com/files/2012/01/IIN.zip) (zipped CSV)
