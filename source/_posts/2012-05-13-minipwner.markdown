---
layout: post
title: "MiniPwner"
date: 2012-05-13 16:24
comments: true
categories: 
---

I recently finished building my first [MiniPwner](http://minipwner.com/) - a tiny [OpenWrt](https://openwrt.org/)-based system for pen-testing. At only 2.25 x 2.25 inches, the device plus battery is still extremely small - it easily fits in a pocket, and could be hidden anywhere. 

The device is based on the [TP-LINK TL-WR703N](http://wiki.openwrt.org/toh/tp-link/tl-wr703n), which uses a 400Mhz Atheros AR7240 CPU - not exactly a power-house, but enough power for standard pen-testing (or even just as a super-portable linux box). In cases where the 400Mhz CPU and 32MB RAM aren't enough, you can easily use OpenVPN as a tunnel to run your tests remotely.

The total investment for the build was only $38 - though next time I'll pay a little extra and get the [16GB drive](http://www.amazon.com/gp/product/B005FYNSZA/ref=as_li_ss_tl?ie=UTF8&tag=adamcaucom-20&linkCode=as2&camp=1789&creative=390957&creativeASIN=B005FYNSZA) - mostly for extra room when working with logs. The 4GB drive used in the standard build has plenty of room for the software - but I'd rather have the extra room to work with.

The build process was process was simple - thankfully the [instructions](http://minipwner.com/index.php/minipwner-build) are quite good, though I did have to change a few things to make it all work.

Step 1): To save looking, [here's](http://downloads.openwrt.org/snapshots/trunk/ar71xx/openwrt-ar71xx-generic-tl-wr703n-v1-squashfs-factory.bin) a direct link to the OpenWrt image.

Step 4): I formated the thumb drive by mounting it in a Ubuntu VM, and used [GParted](http://gparted.sourceforge.net/) to delete the existing partition, and created a 512MB swap partition, then the rest is ext4.

Step 16): Read step 17 first so you don't feel so stupid for wasting time trying to figure out why step 16 doesn't seem to do anything.

Step 21): I use WPA2 on my network, so I had to edit the `/etc/config/wireless` a little differently:

    config wifi-iface
            option device   wlan0
            option network  wan
            option mode     sta
            option ssid     <ssid>
            option encryption psk2+tkip
            option key <password>

More information about the wireless setup can be found [here](http://wiki.openwrt.org/doc/uci/wireless).

Step 24): My local wireless network is in the 192.168.1.x range, so this wasn't working for me. Seeing as changing the wireless doesn't make sense for me (way too many static devices), I had to change the IP address of `eth0` to deal with the issue. I updated my `/etc/config/network` to look something like this:

    config 'interface' 'lan'
            option 'ifname' 'eth0'
            option 'type' 'bridge'
            option 'proto' 'static'
            option 'ipaddr' '192.168.2.1'
            option 'netmask' '255.255.255.0'

Once the change is made, you'll need to execute `/etc/init.d/network restart` - then update your PC's static IP address to "192.168.2.111" and reconnect your telnet session.

Step 27): When executing the installs I was receiving this error:

    opkg_install_cmd: Cannot install package <package-name>

To correct this error, I had to run `opkg update` - after this the installs started working fine.

Step 27b): The install for `samba2-client` was failing, as there isn't a package by that name - though `samba36-client` installed fine.

Overall, it's a great little setup - I'm quite pleased.