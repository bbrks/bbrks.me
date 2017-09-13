+++
title = "Sonos podcasts via Android and Pocket Casts"
description = "A how-to guide for listening to podcasts through Sonos via Android and Pocket Casts"
date = 2016-04-18T18:51:29Z
draft = false
slug = "sonos-podcasting-via-android"
tags = ["sonos", "podcasts", "android"]
aliases = ["sonos-podcasting-via-android"]
+++

<div class="alert alert-warning"><strong>Warning!</strong> This guide is out of date. Please visit the <a href="/native-sonos-podcasts-pocketcasts/">newer version - Native Sonos Podcast support with Pocket Casts</a>!</div>

---

Sonos, sadly has never had a great reputation with podcasts. They just plain don't work. The proposed workarounds, by using services such as Stitcher tend to fall short of available shows and usability.

If you're an avid podcast consumer and use an Android device, chances are you use [Pocket Casts by Shiftyjelly](http://www.shiftyjelly.com/pocketcasts). Pocket Casts recently added a feature to stream straight to Chromecast from the app. Great. But sadly it does not play ball with Sonos (yet).

There have been many suggestions on how to get podcasts working nicely through Sonos via Android. This is by far the best setup I've come across. And especially if you already use Pocket Casts...

---

# Prerequisites

0. Sonos setup + [Sonos Controller for Android](https://play.google.com/store/apps/details?id=com.sonos.acr)... Duh.
* [Pocket Casts](https://play.google.com/store/apps/details?id=au.com.shiftyjelly.pocketcasts)

The Android Sonos Controller will read any audio files stored in `/sdcard/Music` and show in the menu as **'On this Mobile Device'**

The controller will also read audio files stored in `/sdcard/Podcasts` ***if*** there is at least one file in `/sdcard/Music`. This is usually where things don't appear to work if you have no local music on the phone. A quick fix is to put a [blank MP3](http://www.xamuel.com/blank-mp3-files/point1sec.mp3) file into the Music directory.

Once you have a populated Music directory, Pocket Casts can be configured to download Podcasts into the appropriate directory automatically as follows:

* Pocket Casts
 * Settings
     * Storage
         * Store podcasts on: `Custom Folder`
         * Custom folder location: `/sdcard/Podcasts`

![Pocket Casts settings for Sonos Podcasts](/posts/images/2016/04/pocket-casts-settings-1.png)

Once this is done, you'll need to rescan both the `/sdcard/Music` and `/sdcard/Podcasts` directories. There are a few ways to do this:

* Reboot the phone
* Use an app like [SD Scanner](https://play.google.com/store/apps/details?id=com.gmail.jerickson314.sdscanner)

You'll need to force a rescan each time you download a new podcast for it to appear in the Sonos Controller app.

After these steps, you'll be able to open the Sonos Controller and see your podcasts listed under the **'On this Mobile Device'** menu option.

![Sonos Podcasts on Android](/posts/images/2016/04/sonos-podcast-flow-1.png)
