+++
title = "Attempting Cocoa development in RubyCocoa, Obj-C and Swift"
description = ""
date = 2015-04-01T00:06:16Z
draft = false
slug = "cocoa-development-from-rubycocoa-obj-c-swift"
aliases = ["cocoa-development-from-rubycocoa-obj-c-swift"]
+++

I've been looking for a tiny little program for ages. It seems really simple, but I can't for the life of me find one that does what I want!

I wanted a countdown utility in my OS X menubar. Always visible, always looming. I wanted it to panic me when working towards a deadline.

Timers existed, but nothing could count down towards an absolute date or time, just a relative time.

I quickly set out to make my own. What else was I expected to do whilst writing a dissertation?

I'll briefly write about my experience in trying to write a Cocoa application and my three approaches until I got something working.

---

## RubyCocoa

I already know Ruby. I've written Rails applications for my university course, so I thought this would be a solid choice. Absolutely not. RubyCocoa is a pain to get working properly, and not everything is supported in it. I was fighting dependency hell more than getting anything working.

I quickly moved onto Objective-C before wasting any more time.

---

## Objective-C

I'm a big fan of C-like languages, but Objective-C is just an entirely different kettle of fish. Its syntax is bizzare, especially when combined with Cocoa's verbose naming scheme.

I got stuff vaugely working in Objective-C, in the sense that I could create an NSStatusItem and place it in my status bar, but the syntax held me back from doing anything more substantial with it.

Remembering that Apple released Swift not too long ago, I decided to give that a go instead after hearing favourable things.

---

## Swift

Swift was actually really easy to get going with. It seemed like a horrific mixture of C and Javascript that somehow works well.

Within 2 hours and less than 90 lines, I was able to make my countdown clock. Albiet with hardcoded title and target date. But it works! And I can toggle the title on and off.

<img src="/posts/images/2015/04/osx-statusbar-countdown.png" width="452" alt="OS X Statusbar Countdown" />

---

I have the code up in a repo on GitHub, licensed under MIT. I'll be adding a GUI config to change the name and target date soon!

https://github.com/bbrks/osx-statusbar-countdown
