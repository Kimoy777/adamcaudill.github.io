---
date: '2011-05-16 01:29:19'
layout: post
slug: errors-on-gem-install-mysql2
status: publish
title: Errors on 'gem install mysql2'
wordpress_id: '808'
categories:
- Development
- Software
tags:
- Ruby on Rails
- Software Development
- Ubuntu
- Web Development
---

On my fresh Ubuntu 11.04 box running Ruby 1.9.2 instead of the standard Ruby 1.8, I ran into some undocumented errors while installing the `mysql2` gem. Here's what I was seeing:

    $ gem install mysql2
    Building native extensions.  This could take a while...
    ERROR:  Error installing mysql2:
    	ERROR: Failed to build gem native extension.
    
            /usr/bin/ruby1.9.1 extconf.rb
              <internal:lib/rubygems/custom_require>:29:in `require': 
              no such file to load -- mkmf (LoadError)
    	from <internal:lib/rubygems/custom_require>:29:in `require'
    	from extconf.rb:2:in `<main>'
    
    
    Gem files will remain installed in 
      /usr/lib/ruby/gems/1.9.1/gems/mysql2-0.3.2 for inspection.
    Results logged to 
      /usr/lib/ruby/gems/1.9.1/gems/mysql2-0.3.2/ext/mysql2/gem_make.out

This obviously isn't all that helpful, nor did I find anything all that useful on Google - thankfully the issue is easy to solve. All that's needed is to ensure that the following packages are installed:

    sudo apt-get install libmysqlclient-dev libmysql-ruby1.9 ruby1.9.1-dev

Then you can try installing the gem, it should work, hopefully
