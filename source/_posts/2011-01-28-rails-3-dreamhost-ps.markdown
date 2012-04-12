---
date: '2011-01-28 02:47:01'
layout: post
slug: rails-3-dreamhost-ps
status: publish
title: Rails 3 & Dreamhost PS
wordpress_id: '717'
categories:
- Development
- Software
tags:
- Development
- DreamHost
- Hosting
- Ruby
- Ruby on Rails
- SQLite
- Tips and Tricks
- Web 2.0
- Web Development
---

I recently had an idea for a small web application, and seeing as I've not spent as much time as I've wanted to using [Rails](http://rubyonrails.org/) - I opted to build it the latest version of Rails. A decision that caused far more grief than I expected.

If you are using [Dreamhost's](http://www.dreamhost.com/r.cgi?485850) PS offering (a managed VPS for those that don't know), the seemingly simple task of getting a Rails 3 application up and running is actually quite complex. The root cause of this is that Dreamhost's OS image is based on Debian [etch](http://www.debian.org/releases/etch/), which was released in April 2009 and has since been replaced; which means etch has become fairly outdated.

Here's the process I used, and so far it seems to be working quite well:

**Domain Setup:**

When adding your domain to the Dreamhost panel, you'll want to enable [Passenger](http://wiki.dreamhost.com/Passenger).

![](http://adamcaudill.com/files/2011-01-28_0048.png)

Once your application is uploaded to the server, you'll be greeted with a particularly unhelpful error message (something like `uninitialized constant Bundler`) from Passenger (or perhaps just a 500 error page).

**Server Updates:**

This is where the work starts, and gets somewhat ugly. As a warning, it's quite possible that you could damage your configuration doing this; though thankfully you can [restore](https://panel.dreamhost.com/index.cgi?tree=vserver.reboot&) your server to a working state within a few minutes from the Dreamhost panel should something go wrong. You'll also need to have an [admin user](https://panel.dreamhost.com/index.cgi?tree=vserver.adminusers&) for this task, as much of what needs to be done has to be done as root.

First step: Get your PS up to date; even after performing a restore on my server, there were a number of updates that are available to be installed. So let's start off by getting those out of the way.

    sudo apt-get update
    sudo apt-get upgrade
    sudo apt-get -f install

Once you get past those three commands, the next step is to update SQLite to the latest version, as the version Dreamhost uses is quite old and won't work with Rails 3.0 (well, to be accurate it won't work with the latest version of sqlite3-ruby, which is the default database provider for Rails 3).

    wget http://www.sqlite.org/sqlite-autoconf-3070400.tar.gz
    tar zxvf sqlite-autoconf-3070400.tar.gz
    cd sqlite-autoconf-3070400
    sudo ./configure --bindir=/usr/bin --libdir=/usr/lib
    sudo make
    sudo make install

If you don't update SQLite you'll get an error like this:

    sudo gem install sqlite3
    Building native extensions.  This could take a while...
    ERROR:  Error installing sqlite3:
    	ERROR: Failed to build gem native extension.
    
    /usr/bin/ruby1.8 extconf.rb
    checking for sqlite3.h... yes
    checking for sqlite3_libversion_number() in -lsqlite3... yes
    checking for rb_proc_arity()... no
    checking for sqlite3_initialize()... no
    sqlite3-ruby only supports sqlite3 versions 3.6.16+, please upgrade!
    *** extconf.rb failed ***

or if you install the updated version, but don't force it to `/usr/lib` you'll get an error like this:

    sudo gem install sqlite3
    Building native extensions.  This could take a while...
    ERROR:  Error installing sqlite3:
    	ERROR: Failed to build gem native extension.
    
    /usr/bin/ruby1.8 extconf.rb
    checking for sqlite3.h... yes
    checking for sqlite3_libversion_number() in -lsqlite3... no
    sqlite3 is missing. Try 'port install sqlite3 +universal' or 'yum
    install sqlite3-devel'
    *** extconf.rb failed ***

Once that is taken care of SQLite, the rest is easy.

    sudo gem update

At this point if you visit your new Rails site, it _should_ be working!

Notes:

  1. I've not tested this extensively, and I've no idea if this breaks anything. All I can say for certain, if that all of _my_ sites still work, but your mileage may vary. <Disclaimer />

	
  2. I was a fairly early Dreamhost PS adopter, and part way through this process I reset my server to get it back to a clean state. After resetting, I noticed some differences with the behavior of `apt-get` (404s on `update` and `upgrade` are gone), so for other early adopters it may be necessary to perform a reset to get your servers configuration in-sync with the latest official setup.

	
  3. I can't say for a fact that this is completely necessary, though you'll likely need to selectively update a few packages if you skip this step. Also, for me, `gem` was broken until I ran `sudo apt-get -f install`.

	
  4. Special thanks to [Matt](http://matthewjlittle.com/) for helping me get this working; troubleshooting the SQLite install was more than a little time consuming.
