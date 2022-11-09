---
title: "Budget thermal imaging on a NOYAFA NF-583"
description: "Example images, videos, and app install process"
date: 2022-11-09T13:09:21Z
slug: "noyafa-nf-583-review"
tags: ["noyafa", "nf-583", "review", "thermal imaging", "flir", "android", "usb-c"]
---

I was on the market for a cheap(ish) thermal imaging camera as a way to DIY survey the thermal insulating properties of my current house, soon to be new house, and take spooky pictures of my dog.

FLIR are highly regarded and the most well known budget thermal imaging devices that plug in to phones.
FLIR has lots of nice features, like "MSX", which is essentially superimposing an edge detection filter from your standard phone camera on top of the lower resolution IR image.
This allows you to see finer visible details of a thermal image without a costly increase in resolution for the IR camera.

With that said, they still aren't cheap, and the basic FLIR ONE Gen 3 resolution is actually relative poor (80x60 @ 8.7fps) compared to some newer, cheaper, but less-known alternatives were claiming (160x120 @ 25fps)

I took a punt on the **Noyafa NF-583** I found on Amazon, safe in the knowledge that I could return it, should their grand claims be false.
It had one 4 star review on Amazon, and no real-world images available to see before purchasing.

There's relatively little information about this device, as it's only been available for 4 months as far as I can tell from this [Noyafa blog post](https://www.noyafa.com/blog/noyafa-announce-new-cheap-thermal-imaging-camera-for-android-nf-586-nf-583.html).

## Samples

So with that said, hopefully I can be helpful and provide a few real-world sample images and videos that I've taken with it plugged into my Fairphone 4 via USB-C to get an idea of what you're getting.

As you can see, you can't really go much lower resolution without losing important detail, so I understand why FLIR enhanced their images. However, the NF-583 seems more than capable of resolving details in thermal images at 160x120. The 25fps claim is also true, and provides full video recording capabilities with continous temperature monitoring at that frequency.

If you want higher resolution, I believe the NF-586 can do nearly double, at 256x192 @ 25fps - for a price...

### Images

![Thermal image of a room from a NF-583 showing a hot spot in the air brick, and a cold spot on the ceiling](/posts/images/2022/11/2022-11-06-10-06-23.jpg)
![Thermal image of a radiator from a NF-583](/posts/images/2022/11/2022-11-06-10-45-20.jpg)
![Thermal image of a Shiba Inu from a NF-583](/posts/images/2022/11/2022-11-06-16-28-28.jpg)
![Thermal image of an external brick wall showing a hot spot in the air brick](/posts/images/2022/11/2022-11-06-19-12-56.jpg)
![Thermal image of an external brick wall and foundation](/posts/images/2022/11/2022-11-06-19-13-22.jpg)

### Video

{{< youtube OlwI722nWNY >}}

{{< youtube rENBIq_3kRU >}}

## App Install process

### Android

The imaging app is not available on the Play Store, so involves downloading an APK from Noyafa's website and sideloading, which is not only a bit of a hassle and a stumbling block for anybody non-technical, but can also have implications on security.

- Download the **"NF-583/586 APP"** from Noyafa's support/downloads webpage: [noyafa.com/download](https://www.noyafa.com/download)
- Unrar it, which requires another app that is able to extract rar files.
- Install the extracted APK, after disabling the nessesary security measures to sideload apps.

### iOS

The NF-586 is Android and USB-C only.

## Bonus

### Linux

The device exposes itself as a normal webcam when plugged into a computer. The images are raw greyscale and have no temperature information present.

It may be possible to write a USB driver to extract high/low temperature values and interpret the image like the Android app does, however this is beyond my capabilities.

#### lspci

```
TODO
```

#### lsusb

```
TODO
```

