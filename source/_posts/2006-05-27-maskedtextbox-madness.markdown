---
date: '2006-05-27 10:43:21'
layout: post
slug: maskedtextbox-madness
status: publish
title: MaskedTextBox Madness
wordpress_id: '77'
categories:
- Development
tags:
- .NET
- Development
- MaskedTextBox
---

Over the last couple days, most of my time has been devoted to the `MaskedTextBox` control, and one very annoying bug. The issues revolves around the way the control deals with currency. When provided with a mask such as '`$999,999,999`' - you'd expect it to exercise some degree of intelligence. That expectation turned out to be _quite_ wrong.

If you type the number '50' in a box with that mask, you'll end up with '$500,000,000' - for a financial application such as the one I'm working on, that could lead to a major issue. The only way to get the proper value is to set the cursor two places from the right. So if the user doesn't pay attention, it'll be simple to enter a value that is completely wrong.

To add insult to injury, when the control receives focus, it has a habit of setting focus to the end of the mask, where the user can not type due to the length restriction. So the user has to move the cursor to the desired location before they can start to type, and if thy just start typing, the control happily ignores them.

After testing a couple possible solutions ([this](http://blogs.msdn.com/irenak/archive/2006/03/21/556434.aspx) and [this](http://www.c-sharpcorner.com/UploadFile/mgold/MaskedCurrencyTextBox08142005135643PM/MaskedCurrencyTextBox.aspx?ArticleID=3dc8ca4b-7166-4851-ab40-a2150c5ca787)) it soon became clear that the `MaskedTextBox` is too limited in features to be useful for currency. That simple.

My solution to this was to drop the Masked control and create a new control inherited from `TextBox` that supports a few extra features such as:



	
  * Numeric only input

	
  * Minimum Value

	
  * Maximum Value

	
  * Format String support


With less than 30 lines of code, the basic control was in place. I wish I could include a proper answer for this issue to make the `MaskedTextBox` useful, but after loosing two days, I can safely say it's too limited to be of real value for even slightly complex uses.
