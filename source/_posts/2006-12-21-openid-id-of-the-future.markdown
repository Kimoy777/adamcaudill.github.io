---
date: '2006-12-21 20:50:43'
layout: post
slug: openid-id-of-the-future
status: publish
title: 'OpenID: ID of The Future?'
wordpress_id: '156'
categories:
- Security
- Software
- Technology
tags:
- OpenID
- Security
---

After reading [Simon Willison](http://simonwillison.net/)'s excellent [article on the topic](http://simonwillison.net/2006/Dec/19/openid/) I spent a couple hours last night looking at the current [OpenID specification](http://openid.net/specs/openid-authentication-1_1.html), and after a fair bit of thought found the ideas behind [OpenID](http://openid.net/) clever, but not what's needed for the ID of the future.

**What's Right**

OpenID has some really good ideas behind it. Here are a few that really stand out in my eyes.



	
  * If you have a LiveJournal account for example, it just works, no extra sign-up, no additional work.

	
  * The ID is easy to remember, a persons blog / home page URL is among the easiest things for a user to remember.

	
  * De-centralized architecture that minimizes the potential for downtime.

	
  * Anyone can operate an Identity Provider.

	
  * Open, well documented protocol, as well as open-source libraries.

	
  * ID may be portable from one Identity Provider to another without changes to the ID.


**What's Wrong**

There are a number of issues I see with this system, while there are certain advantages; some of these disadvantages are quite disturbing. Here are the issues that strike me as most concerning (in no real order).



	
  * SSL (HTTPS) is not _required_ for any communications. This is a potential security issues, though not as large as could be due to the nature of the system.

	
  * Requires editing HTML for users that do not use a hosting service that automatically adds the OpenID HTML code to the proper page(s).

	
  * Not all hosting services allow the user to edit HTML directly.

	
  * Does not offer a way to communicate enough information, such as would be used to expedite an e-commerce transaction. (This may be changed in future versions, or with extensions.)

	
  * No trust relationships, only verifies a person controls a URL.

	
  * No certification or audits for Identity Providers to ensure end-user security.

	
  * Excessive bandwidth usage. Each login requires parsing at least one full HTML page to identify the Identity Provider server. If a user has `openid.delegate` included in their page, there will be another full page download/parse for each.

	
  * HTML pages must be parsed to identify the Identity Provider server, parsing HTML can raise issues when it contains errors (as is quite common). Seeing as there is no standard library to perform the parsing, HTML with errors may work with some implementations but not with others.

	
  * Anyone that gains access to edit the HTML of the identity URL can steal ones identity just by changing/adding an `openid.delegate`. This is a real risk in some shared hosting environments.


**What We Need**

The idea behind OpenID, to create a distributed identity system that is easy to use and can be used universally is a great idea, and one that should be pursued. If this goal could be achieved, it would be a project that would truly help to make the world a better place (at least it in that it would save everybody time). I have great respect for the work of all that have contributed to the OpenID project; it is a great idea and certainly has uses.

To be truly useful though, an ID system needs to be easy to use for people of all skill levels, with and without web sites. It should provide an option to control how much information is shared with a web site (such as OpenID does), and should have the option to provide information such as shipping or billing information to minimize entering the same data in so many web sites. All the data should be transferred via SSL to ensure the highest level of security.

**Features of The Future ID**



	
  * The protocol should be completely open and well documented.

	
  * The protocol should be XML based so as to be lightweight and easily implemented in any language.

	
  * The ID should be easily used with not only web sites, but via desktop applications and other forms of software that require authentication.

	
  * The organization backing the identity system should arrange for an optional certification program for Identity Providers to ensure that certain basic security policies are implemented. The requirements should be defined by the backing organization and the audit carried out by a third-party auditing firm.

	
  * The IDs should be in an easy to remember format that is easy to type and makes translation back to the provider simple.

	
  * Identity Provides should offer a way to verify that a user is who they claim, not just that they control an ID. This would be an option for users that would be quite useful in applications such as e-commerce use. (This would rely on the provider having a trusted signing certificate and following certain identity verification guidelines.)


While some of these features cover far more ground than something like OpenID, this increased scope is needed to ensure that the ID service can be used in all the needed applications. While it is far more complex to add these extra features, the ability to use the resulting ID for almost any purpose makes it well worth it.

I'm not proposing an alternative to OpenID, simply seeking feedback while passing my feedback on OpenID along for those interested.
