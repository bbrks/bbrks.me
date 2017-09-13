+++
title = "Distributed computing on a Pi cluster"
description = ""
date = 2017-03-28T21:25:42Z
draft = true
slug = "distributed-computing-on-a-pi-cluster"
aliases = ["distributed-computing-on-a-pi-cluster"]
+++

```
diskutil unmountDisk /dev/disk2
sudo dd bs=1m if=ClusterHAT-2017-02-16-lite-1-controller.img of=/dev/rdisk2
touch /Volumes/boot/ssh
diskutil eject /dev/disk2
```

```
diskutil unmountDisk /dev/disk2
sudo dd bs=1m if=ClusterHAT-2017-02-16-lite-1-p1.img of=/dev/rdisk2
touch /Volumes/boot/ssh
diskutil eject /dev/disk2
```

```
diskutil unmountDisk /dev/disk2
sudo dd bs=1m if=ClusterHAT-2017-02-16-lite-1-p2.img of=/dev/rdisk2
touch /Volumes/boot/ssh
diskutil eject /dev/disk2
```

```
diskutil unmountDisk /dev/disk2
sudo dd bs=1m if=ClusterHAT-2017-02-16-lite-1-p3.img of=/dev/rdisk2
touch /Volumes/boot/ssh
diskutil eject /dev/disk2
```

```
diskutil unmountDisk /dev/disk2
sudo dd bs=1m if=ClusterHAT-2017-02-16-lite-1-p4.img of=/dev/rdisk2
touch /Volumes/boot/ssh
diskutil eject /dev/disk2
```
