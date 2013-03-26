---
layout: post
title: "First, Do No Harm: Developers &amp; Bad APIs"
date: 2013-03-26 21:11
comments: true
categories: 
---

**Primum non nocere** (first, do no harm) - an iconic phrase in modern medicine, yet also applicable to many other fields. This is something I wish more people would think about, developers especially - and primarily when writing new APIs. In general, developers don't have an impressive history with security - quite frankly, developers suck. Seeing as I consider myself a developer, that's painful to admit.

Chris Andrè Dale posted an interesting article some time ago that got me thinking: [Why it's easy being a hacker: A SQL injection case study](http://www.securesolutions.no/why-its-easy-being-a-hacker/) - Chris pointed out the problems with educational material that developers are using, and just how bad the examples are. SQL injection is everywhere and very few examples encourage developers to do it the right way - for that matter, very few are telling developers that there is a right way. I'm sure we've all seen similar issues in other areas, not just for SQL injection. 

I had to ask, why? How did we end up in this situation? The industry has come so far in so many ways, it's unbelievable that we still have these fundamental issues. It's clear that the industry is failing, and these are just a few of the areas:

* Educational material is riddled with errors
* Authors rarely understand the security implications of their samples
* Developers aren't taking the time to research the right way to do things
* Developers don't understand the need to consider security implications

...and I could keep going.

**Whose fault is it really?**

If you look at the PHP/MySQL examples that are floating around, you'll notice something interesting: it's really, *really* easy to write bad code. The first examples anyone sees is a simple, one line, easy to understand statement:

```php
mysqli_query($link, "INSERT INTO Persons (FirstName) VALUES ('$_POST[firstname]')")
```

And this simple command is what people use - with no idea how dangerous it is. The API makes writing bad code easy, but how about good code?

```php
$stmt = $mysqli->prepare("INSERT INTO Persons (FirstName) VALUES (?)");
$stmt->bind_param("s", $_POST[firstname]);
$stmt->execute();
```

The first example is simple and clear, the second is a *bit* less obvious. The API design itself is leading developers down the wrong path - it supports two syntaxes, one simple and easy to comprehend - but extremely dangerous, and one that's more complex, less obvious, but safer. Without understanding the security implications, which syntax do you think developers will pick?

While developers should know more than they do (and I'm not trying to excuse their ignorance) - the years of effort and the daily reports of SQLi breaches should tell us that trying to educate all of the world's developers isn't working. As long as the *easy way* to use an API is the insecure way, we'll continue to see a steady stream of breaches.

While I agree with Chris that the documentation is a real issue - the APIs are just as much to blame. *Bad APIs make for bad developers*.

**Secure by default**

When a developer is working on a new API, they should ask if they are doing harm with the design. The maxim "first, do no harm" should be running through their head with each decision. Doing no harm - being secure by default, not leading developers astray - really should be the foremost goal of any API.

I don't mean to pick on PHP's MySQL API here, it's just one of many that are designed this way. Look at any API on any platform, odds are better than not that security was an afterthought - if it was given any thought at all.

As anyone who writes code can attest, writing secure code is hard - but when the APIs that developers are given encourage insecure usage, it's that much more likely that holes will be found. While organizations like [OWASP](https://www.owasp.org/index.php/Main_Page) are making some progress in education and awareness, it's obviously not enough. Platforms need to be updated, APIs need to be fixed - this won't be a quick process, but we won't see real change until the APIs are improved.
