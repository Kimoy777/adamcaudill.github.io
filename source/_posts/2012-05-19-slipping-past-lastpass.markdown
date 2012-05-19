---
layout: post
title: "Slipping Past LastPass"
date: 2012-05-19 13:54
comments: true
categories: 
---

I'm a big fan of [LastPass](https://lastpass.com/) - it's a great service that has impressed me every step of the way. Though it's not perfect, and I've found a small hole that makes it easier for an attacker to get your passwords - if the following are true:

  1. The attacker has physical access to your PC.
  2. You've made the mistake of not locking your PC when you walk away.
  3. You've select the option to stay logged on - which happens to be a default, or, you've left your browser open (as I expect most people do).

{% img center http://adamcaudill.com/files/lastpass_default_opt.png %}

If all three of these are true (or your PC is otherwise compromised) - you probably shouldn't expect much in the way of security, but LastPass does protect you - most of the time. If you try to copy or view a password, you'll be prompted to enter your Master Password - but there's one case that can easily expose your passwords without needing to know the Master Password.

The issue is that LastPass allows you to change the address associated with a login without confirming your master password. This would allow an attacker to update an entry in your vault to a specially crafted page to echo the password - allowing the attacker to see the password and leave minimal tracks behind. I setup a [special page](http://adamcaudill.com/files/EchoLoginForm.html) to test this, it echoes the password as soon as LastPass enters it, allowing me to see the password in a few seconds without providing the master password (it's also possible to update the password without providing the Master Password, providing another opportunity for mischief).

{% img center http://adamcaudill.com/files/lastpass_edit.png %}

**Automation**

While I've not taken the time to build a tool to automate this - it would be a fairly simple process to do, just a matter of investing the time (which unfortunately I don't have). The obvious solution would be to automate the GUI interaction to perform the following steps:

  * Change the URL to a malicious page.
  * Navigate to the page, and log the login data.
  * Revert the URL to the original value.

Using this method it would be possible to collect all of a users credentials within just a few minutes. It's possible there may be a simpler & faster route available by interacting directly with the plug-ins, though in looking at the exports and COM interfaces I didn't see an obvious way to achieve this (which as a LastPass user, this makes me happy).

For an attacker, one substantial upside is that there would be little evidence of the event - while the LastPass Vault will show that all entries have been "touched" recently, I would venture to say that very few users would actually notice.

While this attack requires full access as the logged-in user, if a PC is otherwise compromised (perhaps as part of an APT type attack), it could allow an attacker to greatly expand their activities with a minimal time investment. This is the type of situation that could take a fairly small local information disclosure and turn it into a real nightmare scenario for a targeted user.

**Solution**

The simplest solution for this issue is to require Master Password verification if the URL changes, or at least require it if the domain changes. This should be a minor change for them and will eliminate this attack vector. Thankfully this is a minor issue, due to the three requirements required to pull this off - so I don't believe there is too much risk due to this oversight.
