---
layout: post
title: "2014: Year In Review"
date: 2015-01-01 23:44
comments: true
categories: 
---

Inspired by a post from [Scott Arciszewski](https://scott.arciszewski.me/blog/2014/12/year-2014-reflection), I've decided to go ahead and publish a year in review post. This is something that I've generally avoided in the past, as the tone of these posts is more often than not, just cynicism and negativity. After seeing Scott’s post, it made me think about how such a review can be used to send a positive message — something desperately needed.

Year after year, we see predictions, projections, and sales pitches — and the cynical responses that they always generate. It's so easy to spend time rolling our eyes at vendors and media, instead of looking forward to ways to improve the situation and make the world a better place — even if only in a tiny way. We may not be able to fix the stupid, but we can at least reduce the damage that it does.

## 2014 In Review

So, without further ado, a personal look back at 2014.

### Security Research & Related

Overall this has been a very busy year, and I’ve not been able to publish as much as I’d like. In total, I requested only a single CVE for the entire year - [CVE-2014-2890](https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2014-2890) (I don’t keep a count of how many security related tickets I open, so no idea how many issues I actually reported).

Most of my time was instead spent on a couple projects - [SMIMP](https://github.com/smimp/smimp_spec) and [Psychson](https://github.com/adamcaudill/Psychson) (BadUSB firmware). I’ll talk more about these later. 

I wasn’t able to spend as much time on public application security work as I had intended, but I did get some reports in, some advice given, some progress made.

### Speaking

In 2014 I was fortunate to be asked to speak on a few occasions. When preparing for a talk, I always have mixed emotions — on one hand, it's always been a great experience, a chance to meet new people, share knowledge, and hopefully contribute to the community. On the other hand, it's a significant amount of time that is lost — and time is without a doubt my most limited resource.

Whether it makes sense or not, I generally don't give he same talk twice — especially if the event is recorded. So for each talk, it's a real time & energy commitment. I very much hope that those that have seen my talks appreciated them, and got something out of them.

Here is some information from selected talks:

* [SMIMP at the DEFCON Crypto Village](https://adamcaudill.com/2014/08/16/smimp-at-the-defcon-cryptovillage/)
* [Making BadUSB Work For You - DerbyCon](https://adamcaudill.com/2014/10/02/making-badusb-work-for-you-derbycon/) (YouTube video now over 100,000 views!)
* [Speaking at SC Magazine Congress](https://adamcaudill.com/2014/11/23/speaking-at-sc-magazine-congress/)


### Personal

Personally, this has been a particularly trying year for me, for various reasons. I have, as I always do, made a real effort to not show what's going on when things go wrong. So, for all my friends, and everyone else for that matter — if there were times I was distant or difficult, or evasive — I am truly sorry. 

With that said, the year could have been far worse, and I'm incredibly grateful for all the friends I have — old and new. It was a busy year, with much going on and never enough time to make everything that needed to happen, actually happen.

### Projects

During the year, much of my time was taken up by a couple projects — here is where they stand today:

**[SMIMP](https://github.com/smimp/smimp_spec)** - Without a doubt the most ambitious project I've worked on, with a goal no less than replacing email itself. The first public draft was released in late July — and unfortunately remains basically untouched since then.

Shortly before I released the first public draft, a start-up tried to acquire the rights, so they could develop it, and build there own applications around it. By the time that I told them that I was more interested in making the specification public, they had offered me a position as co-founder in exchange for it.

This project took a substantial amount of time to get to a first draft — and really, it isn't complete yet. Given the original goal of the project, leaving it with open issues really doesn’t bother me — that many more points to talk about.

The original plan for the effort was to spur discussion, to get people talking about how email could be replaced. To be secure, a system must be designed with certain goals and threats in mind - something that didn't happen with email as we know it today. So to fix email, we need to replace it. SMIMP may not be the answer, but we need to do something.

Overall, though there was some positive feedback, I consider the project to be a failure. I'm proud of the work I did on it, but it didn't have the desired effect.

**[Psychson (BadUSB Firmware)](https://github.com/adamcaudill/Psychson)** - Without a doubt the work that had the most people talking. It was a fun project, we managed to get some code in the hands of those that wanted to extend it.

It’s over, and I’m glad it’s over.

**Blog** - This blog has also been a bit less active than I hoped — 16 posts with a total of 18,040 words. I’m pretty sure last year I said I’d blog more. Oops.

**My First Novel** - A couple years ago I started occasionally working on an idea for a novel, this year, I set aside what I had been doing, and started fresh (but still based on the same material). My goal was to finish it this year, by there simply wasn't enough time.

Writing is something that I have yet to determine if I'm actually good at - or if I just limp along enough for others to tolerate. While I could write a technical book with confidence, writing fiction is something that, quite intentionally, pushes what I'm comfortable with.

Making the time and finding the focus for something like this is certainly more difficult than I had imagined. I've come to understand why so many writers drink.

### Overall

I have to say, I love the communities that I work with. I love that I get to deal with challenging problems. I love that I get to find solutions and make them work. But most of all, I’m thankfully for so many friends and great people that make this work truly enjoyable.

## Looking forward to 2015

I have a number of goals for 2015, a number of projects that need my attention, and ideas to make the world just a little bit better.

* SMIMP - While I feel that the project generally failed, there doesn’t seem to be much movement in the let’s-kill-email space, so I don’t think it’s dead quite yet. There just might be another chance to get people talking about a real solution.
* [CurveLock](https://github.com/adamcaudill/CurveLock) - An open source, secure, modern encryption application. This is mainly an experiment - but the goal is to provide high security, in a simple, easy to use application. Hopefully will get a beta out before too long.
* [EncryptingCamera](https://github.com/EncryptingCamera/encryptingcamera-spec) - Prompted by a conversation on Twitter, a few people got together to make a new application that will hopefully protect a few reporters — and others that need to take photos, and secure them from inspection.
* Blog - Last time that I promised to blog more often, I didn’t post again for months, so I’m hoping that I don’t repeat that this time. But I promise to write more, and do my best to keep the content interesting.
* Personal Transparency - I’ve always been very concerned with my professional image, and as such tend to keep many details of my life to myself. One personal goal for this year is to be *just a bit* more open and transparent.
* Novel - I intend to have either a deal signed with a publisher, or to publish as an ebook on Amazon before the end of 2015. One way or the other, I’ll be done with it by the end of the year.
* Research - I plan on spending more time evaluation open source applications for security issues. In just a few hours a week, can have a real impact on making applications and users more secure.
* Open Source Security Tools - I hope to dedicate a reasonable amount of time on new and existing tools to make users more secure, especially when it comes to secure communication. PGP/GPG hasn’t aged well - tools like [reop](https://github.com/tedu/reop) have a lot of technical potential, but usability still needs to be improved.
* More time outside of the echo chamber - It’s easy to stay inside of the echo chamber, agreeing with ourselves (or disagreeing), but what good does it really do? To have a real impact, we need to spend more time influencing the people that need our help the most.
* Consume less, create more - In general, consume less and create more — time is a precious and limited resource, should be used to do as much good as possible.

Oh, and one final note for next year - my wife and I are expecting again. Should be an exciting year.
