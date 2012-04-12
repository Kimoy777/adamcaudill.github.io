---
date: '2009-12-20 22:42:59'
layout: post
slug: whats-your-code-legacy
status: publish
title: What's your Code Legacy?
wordpress_id: '526'
categories:
- Software
tags:
- Development
- Software Development
- Web Design
- Web Development
---

When you move on to your next challenge how will those that inherit your code think of you? Noble or notorious, innovator or insane? This is a question that all developers should ask themselves frequently; though too few ever do. You should always write with the assumption that someday a new developer will take over your code, and they will question every decision and assumption you've made. When this happens, what will they think of you?

Perhaps I'm more aware of this because I maintain an internally developed shared library that my company uses in every application; but regardless of the scope of the project you should always assume that someday you will hand the project off. Many developers think little about what happens to their code after it passes on to another; what other developers will have to deal with, or how their efforts will be perceived.

When I'm training a new developer there are a few points I try to reinforce as much as possible:



	
  1. Code is only good if other developers can work on it without extensive training. If it takes days or weeks of introduction to get a new developer up to speed, then you've done something wrong1.

	
  2. Clever solutions are no better than an ugly hack if it's not clear what you are doing. If the code isn't clear then it's not maintainable, if it's not maintainable then it's junk.

	
  3. Assume you'll be hit by a bus. Always write code with the assumption that you won't have the opportunity to cleanly pass the code off to a new maintainer. Never assume that you'll have time to come back and clean things up later.

	
  4. Always perform design reviews, no matter the size of the project2. Once you have a design in mind, talk it through with a at least two other developers. Just because you think it's clean and clear doesn't mean that others will see it that way as well.

	
  5. Be consistent, always. I've seen more projects ruined by people doing things "their way" than anything else. Match style and design when working on an existing project. Be careful when adding new techniques, technologies, or methodologies to an existing project; unless you are willing to update the entire code-base, you can easily create a minefield without realizing it.


If you want your work to be seen positively after you move on, start thinking about your heirs today. The opinion they have of you will be almost entirely based on what they see in your code - not the stories or memories left behind.

1 - There are always exceptions; these are generalized guidelines, not hard and fast rules.
2 - This includes "throw away" projects, many projects that are intended to have a short life end up living far longer than intended. This is the most likely place that your heirs will find code that makes them question the quality of your work.
