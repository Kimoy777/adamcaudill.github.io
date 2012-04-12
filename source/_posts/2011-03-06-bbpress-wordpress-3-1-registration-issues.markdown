---
date: '2011-03-06 03:39:49'
layout: post
slug: bbpress-wordpress-3-1-registration-issues
status: publish
title: bbPress & WordPress 3.1 (Registration Issues)
wordpress_id: '733'
categories:
- Development
- Software
- Technology
tags:
- bbPress
- Development
- PHP
- Software
- Web Development
---

While building a new website for a small ISV, I was asked to integrate a forum - should be simple I thought, I'll just use WordPress as a CMS and [bbPress](http://bbpress.org/). Simple? Not quite.

To make things easier, I used [Platform Pro](http://www.pagelines.com/themes/platformpro/) by Pagelines (a great platform IMHO) and so used their "deep integration" [instructions](http://www.pagelines.com/docs/bbpress-forums) (while they are intended for Platform Pro users, the steps are virtually identical for all other setups). While the setup went quite smoothly, it wasn't until it came time to test user registrations that the issue came up: when a new user tried to register they would receive an error stating that "email is required," even if they had entered a valid email address. This effectively made it impossible for users to register, and thus made the forum useless.

After a bit of research, it looks like there is a conflict between newer versions of WordPress (3.0+) and bbPress 1.0.2 (I'm not sure if older versions have the same issue, but I would assume so). The fix for this is actually quite simple: install a [plugin](http://bbpress.org/plugins/topic/zaerl-wordpress-3-integration/). The plugin itself is quite simple - containing only around a half-dozen executable lines of code, and works around the issue with a simple hack.

Unfortunately, the plugin description is rather vague and required a fair bit of research to identify as the fix, and the official documentation makes no reference to the issue or that this plugin can be used as a workaround.

Overall, a simple workaround but a major issue if you don't notice that it's broke (as is quite easy to do).
