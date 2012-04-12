---
date: '2006-04-02 17:23:26'
layout: post
slug: vb-the-dumbing-of-a-great-language
status: publish
title: 'VB: The dumbing of a Great Language'
wordpress_id: '35'
categories:
- Development
---

Visual Basic is at an interesting crossroads, it's at a critical juncture between two paths. One path, it has followed since its earliest days, where simplicity and ease of use ruled over maintainability and solid design. The other, the longer, harder road, is that of design over ease. With the release of Visual Basic .NET, a major shift occurred in the direction the language is taking, though looking back now, nearly 5 years later, I'm finding myself concerned for the future of the language.

Before I go much further, let me give you some background so that you can have a clearer understanding of my perspective. I'm a VB developer, I work exclusively in Visual Basic, and quite honestly I do love the language. It's productivity at it's best. I started using VB5 and at some point, I've used every version since then. So while I will be saying some negative things about VB, this isn't bashing the language, this is me trying to open people's eyes to the state of a great language.

**The Problem**

The issues VB as a language is facing is the desire from Microsoft to keep long-time users around, while trying to advance the language. Instead of making a clean break, they are falling into the trap they fell into with Internet Explorer, where they continued to build on broken code, to ensure that thing would work the same way (the IE team is trying to [get out of the hole](http://blogs.msdn.com/ie/archive/2005/10/12/480242.aspx)). This has resulted in a language that makes heavy use of crutches to prevent pre-.NET users from having to re-learn their language.

While backwards compatibility is a nice thing to offer, when you are making major changes to a language, sometimes it's best to start over and break the mistakes of the past. I understood the forces at play when .NET was originally released, so it's understandable that Microsoft would choose to add crutches to make the transition easier. All of 5 years and two versions latter, the picture doesn't look any better.

I had hoped that the crutches included in .NET 1.0 & Visual Basic 2002 were temporary and would fade out as new versions are released. Nope. Instead of removing this legacy support, they continue to add more as the marketing forces inside Microsoft push to get the remaining pre-.NET VB developers to migrate. This is the same thing that was being done with Internet Explorer, which when the next version, 7, is released, it will cause many web sites to either display improperly, or not function at all. They are breaking it to fix it, I'm afraid we'll need to get to the same point with VB before it continues down the proper path.

As compatibility is continuously made a priority over good design, VB will continue to slip, and continue to carry the reputation the mistakes of the past gave it.

C# was created with a true, very logical OOP model, VB was developed with a concoction of the C# & VB6 models, which is enforced by both the compiler and the Visual Studio IDE. These are not simply issues with the use of legacy methods, but the very model that the language is based on.

**Who's To Blame**

Microsoft, of course.. right? Wrong.

The problem lies with the developers that use VB, not those that develop it. The primary issue I see is that legacy developers are not investing in the training or education to use VB properly. They continue to use antiquated methods and models they learned from VB6 and its predecessors.  The issue is that they create a hybrid type of code, that doesn't follow a logical OOP model, instead following the pseudo-OOP model processed by VB6.

VB.NET has the potential to be a truly great language, the main issue is its habit of thinking for the developer, C# was developed without the mistakes of prior languages, and has so far done very well as it can take full advantage of the .NET Framework. VB on the other hand is somewhat limited in that due to trying to partially emulate the object model and structure of its predecessor, it loses flexibility granted to the other .NET languages.

**How to fix it**

Great question.

The only answer I see is to stop using legacy functionality, and calls for Microsoft to clean up the model used. When writing code in VB or C#, the IDE & compilers should produce virtually identical code. As it stands now, there is a significant difference in the code the compiler generates, the assumptions it makes (many of which can _not_ be over-ridden).

Until developers stand up, and take responsibility for using the language in the way it should be, I doubt we'll see any progress. We can hope things will change, but I'm not holding my breath. (Though, as a side note, C# is looking more appealing every day.)
