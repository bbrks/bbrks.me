+++
title = "CoreOS/Docker setup on a Kimsufi dedicated server"
description = "A step by step guide on installing CoreOS on Kimsufi dedicated servers and getting started with Docker."
date = 2015-09-17T20:10:23Z
draft = false
slug = "coreos-dedicated-server-setup"
aliases = ["coreos-dedicated-server-setup"]
+++

<div class="alert alert-warning"><strong>Warning!</strong> This guide is out of date. Please visit the <a href="/coreos-on-kimsufi-round-2/">newer version</a>!</div>

---

I recently bought a new dedicated server from Kimsufi, which is much more powerful than my old one. Rather than just installing Ubuntu, Debian or Arch and setting up services, I thought I'd try and go down the Docker route with CoreOS. This turned out to be much easier than I anticipated! So here's a quick rundown of how I got it working.

---

Kimsufi do not provide a CoreOS template to install, so we will be using the netboot rescue feature to install it manually on our server.

### Installing CoreOS

- In your Kimsufi dashboard, click 'Netboot', and select 'Rescue'. You will then be asked to reboot your server.

- Once rebooted, you will receive an email with an IP, username and password to use with SSH.

- Log in via SSH, and create a cloud-config.yaml file like below

`# vi cloud-config.yaml`

```
#cloud-config

users:
  - name: "..."
    groups:
      - "sudo"
      - "docker"
    ssh-authorized-keys:
      - "ssh-rsa "..."
```

Replace name with the username you wish to use to log in to CoreOS, and ssh-rsa with [your public ssh key](https://wiki.archlinux.org/index.php/SSH_keys#Generating_an_SSH_key_pair).

- Next, download the CoreOS installer, and run it with the cloud-config.yaml you just created.

`# wget https://raw.github.com/coreos/init/master/bin/coreos-install`

`# ./coreos-install -d /dev/sda -C stable -c cloud-config.yaml`

- When CoreOS has been installed, go back to the Kimsufi dashboard, and change your netboot setting back to 'Hard Drive' and reboot again.

- You should now be able to SSH to your CoreOS install with the username and private key provided.

- From here on, you can set up docker containers, which will be another post. For now, you can read about [Getting Started with Docker](https://coreos.com/os/docs/latest/getting-started-with-docker.html) on the CoreOS website.
