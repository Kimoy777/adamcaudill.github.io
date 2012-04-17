---
date: '2012-04-14 23:56:24'
layout: page
slug: rtsbot
status: publish
title: RTSbot
---

## What is RTSbot?

RTSbot is a web crawler or spider that retrieves the [robots.txt](http://www.robotstxt.org/) files from web sites for use in a security research project. The only file it will access is the robots.txt file in the root of your site (example.com/robots.txt), and under normal conditions, it will only access a domain once. It can be identified by the following user-agent:

    Mozilla/5.0 (compatible; RTSbot/1.0; +http://adamcaudill.com/rtsbot/)

If you are interested in the software, the code is available on [Github](https://github.com/adamcaudill/robotstxt-grab).

The current version (1.0) doesn't pre-resolve domains before assigning work, so it's possible that one server that hosts many sites will receive several requests in a short amount of time. I apologize if this causes any inconvenience.

## Why are you doing this?

The robots.txt standard is designed to keep material off of search engines, but I've begun to wonder how many people have mistakenly used it as a security tool. Thinking that if they exclude it from search engines, attackers would be less likely to find it. A file like this demonstrates the point:

    User-agent: *
    Disallow: /private/
    Disallow: /phpMyAdmin-hidden/
    Disallow: /admin/

A file like this could give a novice administrator the (very false) impression that these items are secure.

My goal with this project is to gather millions of these files, and through various data mining techniques try to determine if web developers and administrators are inadvertently exposing information that could aid an attacker.

## So are you hacking me?!

Not at all. The goal is to get a better understanding of a potential security risk, not to exploit it. Any data released from this research will be anonymized.

## Should I be worried?

If you aren't sure, you should look at your robots.txt file to ensure that there is no information that could aid an attacker. Remember - any information that you expose about your systems or how they work could make it easier for an attacker to determine a vector of attack.
