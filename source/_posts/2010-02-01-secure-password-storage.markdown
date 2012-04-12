---
date: '2010-02-01 02:08:35'
layout: post
slug: secure-password-storage
status: publish
title: Secure Password Storage
wordpress_id: '556'
categories:
- Software
tags:
- .NET
- Development
- Security
- Web Development
---

Do you use MD5 or SHA1 to store passwords? Think they are secure? Think again.

While generic hashing algorithms are certainly better than storing passwords in [plain text](http://www.techcrunch.com/2009/12/14/rockyou-hacked/), it's still not as secure as it should be. Users place great trust in us to ensure that their credentials will be secure and treated with the utmost respect; it's our responsibility to live up to these expectations.

With the simplicity and speed of these general purpose algorithms, it's possible to generate hashes looking for [collisions](http://en.wikipedia.org/wiki/Collision_(computer_science)) (or even the original value) extremely quickly. It's this speed that introduces the fatal flaw; with a database dump containing MD5 hashed passwords, with a fairly small investment most could be recovered within a very small amount of time (mere days for a large database).

Many people are moving to bcrypt as a solution. In Coda Hale's "[How To Safely Store A Password](http://codahale.com/how-to-safely-store-a-password/)" he covers this topic in more detail, complete with useful stats and links to implementations in languages from [C#](http://derekslager.com/blog/posts/2007/10/bcrypt-dotnet-strong-password-hashing-for-dotnet-and-mono.ashx) to [Ruby](http://github.com/codahale/bcrypt-ruby) (even [Erlang](http://github.com/skarab/erlang-bcrypt) is represented).

If you are looking for ways to better protect your user's data, take a closer look at your password storage.
