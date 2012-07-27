---
layout: post
title: "Decrypting Spark Saved Passwords"
date: 2012-07-27 00:44
comments: true
categories: 
---

A friend of mine has been evaluating an open source instant messaging client called [Spark](http://www.igniterealtime.org/projects/spark/http://www.igniterealtime.org/projects/spark/), which can be linked to Active Directory for authentication. Like most IM clients, Spark allows users to save their password - and me being me, I was curious as to how it's doing this - as storing Windows domain logins is kinda a big deal.

So, within a few minutes I found all of the details - and none of them make me feel any better. Here are the important bits:

* Encrypted with Triple DES in ECB mode.
* IV isn't being set.
* Encryption key is **hardcoded**.

This means that all users have the same, [publicly documented](http://svn.igniterealtime.org/svn/repos/spark/trunk/src/java/org/jivesoftware/spark/util/Encryptor.java) encryption key protecting their password. What's the key? It's `ugfpV1dMC5jyJtqwVAfTpHkxqJ0+E0ae` in Base64 encoding - and thanks to this, it's trivial to write code to reverse the "protection" and make the credentials (which may well be domain credentials) available to anyone with access to the users profile.

So, that's what [I did](https://github.com/adamcaudill/sparkim-passview). This is simple code that will scan a machine looking for Spark configuration files (named `spark.properties`) and checks each to see if a password can be extracted. You can also pass in a NetBIOS name, and it will attempt to use the administrative share (C$) to access the profiles on the system. Take a look at the [README](https://github.com/adamcaudill/sparkim-passview#spark-im-password-decrypter) for more details.

The saving grace here, is that you have to have access to the user profiles, so if a system is locked down throughly, you likely won't make much progress. But if you can get a local administrator account to run this from - it may make a pentest go a little quicker.

I've tried to find a way to disable the 'Save Password' feature, but it seems that the only option was to [patch the source](http://community.igniterealtime.org/thread/37785). If you are using Spark within your environment, I strongly recommend that you carefully consider how it's used and integrated with AD or other systems.
