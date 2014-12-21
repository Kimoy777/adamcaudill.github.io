---
layout: post
title: "Irrational Attribution: APT3.14159"
date: 2014-12-20 23:01
comments: true
categories: 
---

*[Note: This is satire / fiction; well, more or less - probably more more than less. Any resemblance to real companies, living or dead, is purely coincidental.]*

WASHINGTON, D.C — Unnamed White House officials that spoke on the condition of anonymity, have stated that a major American company has been hacked, and the attackers are threatening to release terabytes of proprietary information. The name of the company has not been released at this time.

The officials say that the attack came from a state-sponsored attacker — the speed at which the attackers gained control of the company’s network, the focus on administrative credentials, and the sophistication of the previously unseen malware used in the attack. Based on IP addresses used, the attack has been tied to Belize.

Security researchers from Mendyant Security are working a new report, to be released next week. They have dubbed this new group APT3.14159 - and have identified prior attacks that share similarities with the new attack revealed today. They have identified the attackers as Unit 26478 of the Belize Defense Force.

Officials from the Belize Defense Force refused to comment on this story.

***

“I just talked to the CEO, he wants hourly updates on our findings. Now that the FBI, and Mendyant Security is involved, he wants to know, real time, what’s going on and what we’ve found” said Bob, the middle-age middle-manager that had no experience with security, but accepted the position because it paid more.

“Bob, there are three of us, you have three analysts on the team - we are the entire security team, and we’ve been working for two days straight so far. We’ve had to shut down the entire network - even the core switches are down. We can’t access anything, the US data center is in New York, and the secondary in in Japan. We’ve spent the last two days just collecting notes and making sure that everything was shut down. Here’s your update: we know nothing besides that we were hacked.”

Jerry, a tall, slender, over-worked security analyst had spent the last two days trying to contain a massive hack that liked impacted everything inside the company. Having only three analysts that could do anything useful - and multiple managers that wanted constant updates so they would appear useful - the team was exhausted, confused, and unable to do anything at this point.

The attackers had sent company executives screenshots and file listings from the data they had collected, and demanded a ransom or they would release the data and destroy their systems - the executives couldn’t make anything of it, so assumed it wasn’t important. The security team wasn’t made aware of the emails until workstations started dying.

Two hours after the deadline passed, workstations throughout the multinational company started to fail. At first, the local technicians assumed it was just an unusual rash of hardware failures. By 9AM Eastern the next day, over 3,000 machines had been reported offline, with the number impacted climbing rapidly.

Then, finally, someone called the Director of Information Security - but by unfortunate coincidence he was in a meeting until 10AM. When he finally talked to the technicians, the number reported had grown to 5,500 - he immediately called the Senior Manager of Security Assurance. Unfortunately though, she worked in the west coast, and didn’t start her day until noon eastern time. She immediately realized that something very bad was going on, and asked the Manager of Systems Security (Bob), to have his team of analysts look into it. Bob though, though it was an Information Services issue, and directed the issue to the Senior Manager for Systems & Infrastructure. Two hours later, after traversing his chain of command, he determined it was a security issue, and sent it back to the Senior Manager of Security Assurance. By the time it landed back on her desk, at 2PM Eastern, the number on downed workstations was now over 10,000 and 500 servers. She again passed the issue to Bob, and at 3PM the analysts were finally aware that something had happened.

Once the small team of security analysts were finally made aware, they quickly started to do damage control - disabling all connections to the internet, disconnecting the separate physical sites, anything they could think of to limit the spread of whatever this malware is.

One of the analysts quickly pulled an image of one of the local manager’s laptop, and began to analyze it on her personal machine - all the security analysts assumed that their machines would be wiped too, so any serious work was done on their personal laptops. Within an hour she identified an unusual file, that was named similar to a critical Windows file, but wasn’t signed by Microsoft. She uploaded the file to VirusTotal - none of the engines detected it as malicious, nor did their antivirus software of choice. She noticed that it referenced a well known driver used in commercial software to wipe drives before disposing of them - this looked like the smoking gun.

Thanks to her quick work, they were able to get technicians at local sites to begin cleaning up - by then end of the day, only half of their machines had been wiped. Had it not been for her identifying it, all of their Windows workstations and servers would have been wiped.

“Well, what do I tell the CEO Jerry?”

“Tell him there’s nothing more we can do, so we went to bed. We’ll be back tomorrow-ish” - and with that, the entire team (all three of them) walked out the door.

***

Inside a five story brick office building, on the outskirts of San Francisco a team of analysts for Mendyant Security study the limited logs available and the sample of the malware the Sone Corp analyst found.

From looking at the debug information and embedded strings, there were clear signs of Spanish and Kriol - a dialect of Creole that is common in Belize. The mix of languages in the strings and in the file paths led the analysts to conclude that it wasn’t the work of a single person, but a multilingual team.

The logs indicated that the malware was connecting to China, India, Spain, and Russia. After some initial analysis, all of the Command & Control servers used a particularly old version of a content management system, and were easily hacked. The analysts decided that seeing as these servers were likely hacked, and that the easiest way to gather information from them was to go ahead and hack them and collect whatever information they could.

Within a couple hours, they were downloading full copies of all the data on each of the servers. Once downloaded, they would study the C&C software to see if anything interesting is going on.

The C&C software was written in PHP, and did fairly little on its own - most of the commands were relayed back to a hard-coded  IP on port 31337. The server at that IP was no longer online, so  one of the analysts contacted a security researcher that had been performing internet wide scans, asking if he had any information for that IP. They were lucky, his logs showed that an HTTP server came online on that server a little over six months ago, and disappeared on his last scan, just two days ago.

Looking up the owner of the IP, it was register to the Belize Defense Force. APT3.14159 was born.

The story is clear, hackers for the BDF hacked the C&C servers, having them relay to their own server; once detected, the main server was taken off line.

***

NEW YORK, N.Y. — Today, the FBI revealed that the major corporation attacked by hackers working for Belize, is Sone Corp., a entertainment powerhouse. The stock briefly dropped 5%, but closed the day with a minor increase.

Anonymous source within the government have revealed that they are completely confident that Belize is completely behind this, and other recent attacks. “There will be a price to pay for attacking American businesses - the administration is reviewing the options in response to this clear act of cyber-terrorism” - the source refused to be identified as they weren’t authorized to speak on the subject.

***

With the media in a frenzy, the President was forced to make a statement, formally accusing Belize of attacking not only Sone Corp, but several smaller attacks over the last six months. The tone was harsh, there were promises of severe economic penalties. The United States would not tolerate such attacks.

***

*Six months earlier…*

In a small bar off of the Las Vegas strip, a small group of pentesters seek refuge from the chaos that is DEF CON. After a few rounds of top-self whiskey, one has a bright idea…

“I’d bet if we spent a few dollars to get a VPS in China, hacked the first military server we can - pull off a few attacks, within a few months we could get the U.S. Government & some of these big security contractors to label us as a nation-state actor.”

“Nah, I’m sure they get the NSA TAO involved to verify before pointing fingers.”

“$1,000 says it’ll work.”

“You’re on.”
