---
title: "Enshittification that has pissed me off recently"
description: "A raw catalogued rants about personal encounters of shitty rug-pulls and overly-greedy companies and their extortion tactics"
date: 2025-09-09T20:48:37Z
slug: "enshittification"
tags: ["enshittification", "rants"]
---

# _enshittification_

> noun | `[en-shit-uh-fi-key-shuhn]` | `/ ˌɛnˌʃɪt ə fɪˈkeɪ ʃən /`
> >
> When a digital platform is made worse for users, in order to increase profits

---

Please find below a series of raw catalogued rants about personal encounters with overly-greedy companies and their extortion tactics on top of already expensive purchases.

Whenever a company decides to rug-pull, ransom or bait-and-switch me, it goes here, along with my pledge to divest and boycott and a lesson learned for next time.

## Cumulative value of lessons learned

Currently over £3,920

And might I say, all quite **happily** spent originally, often _many years_ before these products and brands subsequently self-destructed.

## Events

### 2024-2025 - tado Cloud API ransom - Cost: £450

Tado are locking down their Cloud REST API to only **_100 requests per day_**, unless I fork out for an extra £30/yr ~~bribe~~ package and get a more reasonable 20,000 requests per day.

100 requests sounds like a lot, until you consider 8 radiators with a slow 15-minute temperature polling limited to run only from 5am onwards _still_ blows past the limit before sunrise in winter in the UK.
The more tado devices you have, the fewer requests you get per-device. Absolute genius move.

This is not the first time they've been in hot-water for ransom, even in the last 6 months.
Their own mobile app (which is the only official way to actually use the product) seems rife for future enshittification.

Have a look at this £1/month "its just a marketing test bro" they conducted on customers to test the waters earlier this year:

https://www.theverge.com/news/615975/tado-smart-thermostat-tests-app-fee 

They must be so absolutely desperate for money and have so badly fucked up their product implementation and business costings that even _after_ the expensive purchase none of this is a viable product.

For some context, they provide virtually no offline/local API, which as a nice reminder - **WOULD COST THEM NOTHING TO OPERATE**.
Certainly not one currently functional enough to save their business model. It cannot do battery monitoring, scheduling, nor hot water control.

This REST API they are attempting to extort me for, I actually do not use directly.
I use the Home Assistant integration (used by over 12,000 people - many of which seem [similarly unhappy](https://github.com/home-assistant/core/issues/151223))

This is my _exact_ purchase history, including all of the bundles and deals I used.
It would cost even more had I not done this.

| Item                                                             | RRP      | Sale Price  | Notes                                 |
| ---------------------------------------------------------------- | -------- | ----------- | ------------------------------------- |
| Wireless Smart Thermostat Starter Kit V3+ with Hot Water Control | £200     | £130        | -                                     |
| Smart Radiator Thermostat 3-Pack                                 | £225     | £160        | One of these broke almost immediately |
| Smart Radiator Thermostat 3-Pack                                 | £225     | £160        | -                                     |
| **Total**                                                        | **£650** | **£450**    | -                                     |

It's now September 2025. I have had _less than 1 year_ of ~~ownership~~ use of what was a promising product, and they're already squeezing me for more money at every opportunity, **and** have shifted focus to their Tado X line.

No fucking thank you! Have a look around on Ebay or Facebook marketplace for some amazing tado deals. I'm sure you'll find plenty coming up.

I have rather quickly realised the money saved with the smart heat-demanding TRVs is **_miniscule_** compared to the cost of purchasing something like this, even if it makes your entire home a little more comfortable and hands-off.

### Verdict

**Aggressively divest** - There are plenty of [Zigbee TRV alternatives](https://www.zigbee2mqtt.io/supported-devices/#e=climate) that can't be squeezed like this, or sack all that off and get old fashioned thermostatic valves and deal with the occasional chill.

## 2018-2025 - Synology - Forcing expensive branded HDDs - Cost: £540

I'm a long time Synology user and have been generally happy. See my previous blog posts about it!

This April they decided that they would like to get some more money direct from consumers by forcing support only for their own HDDs. Neat!

https://www.tomshardware.com/pc-components/nas/synology-requires-self-branded-drives-for-some-consumer-nas-systems-drops-full-functionality-and-support-for-third-party-hdds

### Verdict

**Boycott** and move to open source. Next NAS will be self-built or an off-the-shelf hardware TrueNAS device.

## 2023-2024(?) - Sony WH-1000XM5 - Bad firmware/hardware? - Cost: £280

Randomly pops and turns off. Almost daily, sometimes multiple times a day. No rhyme or reason.

Original MDR-1000X and WH-1000XM4 were both great.

[Widespread](https://www.reddit.com/r/SonyHeadphones/comments/1ishl92/sony_wh1000xm5_anyone_still_has_that_problem_that/) completely [unacknowledged](https://us.community.sony.com/s/question/0D5Dp00002K5K0IKAV/wh1000xm5-keeps-shutting-down-randomly-after-a-pop?language=en_US) issue.

### Verdict

**Tolerate**, but won't buy another pair of Sony ANCs unless this is actively addressed or acknowledged.

## 2016-2024 - Sonos - VERY BAD app update virtually bricking products - Cost: £2150

They rewrote their app and speaker firmware to support some shitty headphones, dropped useful functionality, pushed a lot of local network control off up into the cloud for no good reason and then blamed users and their wifi networks for poor performance.

High latency and/or complete loss of control, even if you press pause or volume buttons _on the actual speaker playing the music_... **WTF!**

They claim to have resolved a lot of the issues, which might be true if you have newer hardware. Mine - itemised below, is a different story.

| Item      | RRP            |
| --------- | -------------- |
| Playbar   | £700           |
| 5x PLAY:1 | 5x £170 (£850) |
| Play One  | £200           |
| Connect   | £400           |
| **Total** | **£2150**      |

Still completely unusable 1.5 years later, after working flawlessly for 7+ years prior. What an investment...

### Verdict

**Aggressively divest** - Nothing works well, and they make for expensive and ageing paper weights.
Have not found a suitable alternative and am looking at more traditional hifi setups.

## 2021-2023 - Proscenic - M7 Pro - Robot Vacuum Cleaner - Cost: £500

Having a robot vacuum is super useful because it runs around multiple times a day cleaning up after my forever shedding dog. Legitimiately a QoL improvement and not just a gadget.

Unfortunately, the app was forever janky, but they also updated it in 2023 which stopped the M7 Pro from being able to connect completely. Many [other](https://www.reddit.com/r/RobotVacuums/comments/15so69i/proscenic_m7_pro_app_cant_add_wifi/) users [report](https://www.reddit.com/r/RobotVacuums/comments/jheris/proscenic_m7_network_configuration/) the [same](https://www.reddit.com/r/RobotVacuums/comments/1hy2chy/proscenic_m7_pro/) issue and support say the [device is just ewaste](https://www.reddit.com/r/RobotVacuums/comments/1dexruz/proscenic_m7_pro/)!
It still works if I roll back to a really old APK. Server still somehow running but I'm just waiting for the day it disappears. No local/offline access possible.

### Verdict

**Boycott** Proscenic and similar OEM rebadging companies. Run the device into the ground whilst the servers are still up.

Make sure my next robot vaccum cleaner is capable of being flashed to run [Valetudo](https://valetudo.cloud/).

## Future Reading

For more sweary enshittification rants, maybe you'll enjoy [Louis Rossmann](https://www.youtube.com/@rossmanngroup/videos)
