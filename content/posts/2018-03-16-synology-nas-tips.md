---
title: "Synology NAS Tips"
description: "Getting a Synology NAS to behave a little more sanely..."
date: 2018-05-15T00:09:10Z
draft: true
slug: "synology-nas-tips"
tags: ["synology", "nas", "tips", "linux"]
aliases: ["synology-nas-tips"]
---

I finally got around to replacing my ancient USB 2.0 HDD, with frayed power lead, hooked up to a Gen-1 Raspberry Pi that acted as a Media Server, NAS, and general false sense of security...

I ended up spending more than anticipated, and getting a [Synology DS918+](https://www.synology.com/en-global/products/DS918+), loading it with four 4TB drives in a RAID 5 array, for a total storage capacity of 12TB with single disk redundancy, and [16GB of RAM](#ram) for all those Docker containers/VMs I run.

I was hesitant at going down the Synology/Qnap route over a self-built NAS running an Open Source NAS distro like [FreeNAS](https://www.nas4free.org/), but in the end, ease of setup/peace of mind won, and I forked out for it.

There were however, some creature comforts that I immediately missed when using the Synology NAS...

1. [Key-Based SSH Logins](#sshkeys)
2. [Sudo-less Docker](#sudolessdocker)
3. [TLS terminating proxy to Docker containers](#tlsproxy)
3. [Additional RAM (16GB)](#ram)

---

## Key-Based SSH Logins {#sshkeys}

This is a must. Being able to disable password login via SSH is a huge security win, and makes my life easier with a passphrase-free key.

I found a great post by [Scott Granneman](https://www.chainsawonatireswing.com/) detailing what it takes to get SSH keys working under DSM, but unfortunately involves a bit of hoop-jumping.
I'll be copying the steps that Scott has written, just for reference's sake.

1. Edit `/etc/ssh/sshd_config` to uncomment the `PubkeyAuthentication` and `AuthorizedKeysFile` lines:
```
#RSAAuthentication yes
PubkeyAuthentication yes
AuthorizedKeysFile .ssh/authorized_keys
```

2. Now make an `.ssh` directory, and `authorized_keys` file for the root user:
```
# cd /root
# mkdir .ssh
# touch .ssh/authorized_keys
```

3. Lock down the permissions on this directory and file.
```
# chmod 700 .ssh
# chmod 644 .ssh/authorized_keys
```

For non-root users, you'll need to enable home directories first, or else you'll see this error when logging in:

```
Could not chdir to home directory /var/services/homes/admin: No such file or directory
```

In DSM, go to `Control Panel > User > Advanced > User Home`.
Tick `Enable User Home Service` and choose a volume for home directories.
Then simply repeat steps 2 and 3 from above, inside the user's home directory.

Sources:

- [SSH into your Synology DiskStation with SSH Keys](https://www.chainsawonatireswing.com/2012/01/15/ssh-into-your-synology-diskstation-with-ssh-keys/)
- [Log in to a Synology DiskStation using SSH keys as a user other than root](https://www.chainsawonatireswing.com/2012/01/16/log-in-to-a-synology-diskstation-using-ssh-keys-as-a-user-other-than-root/)

## Sudo-less Docker {#sudolessdocker}

Occasionally, I'll dip into the Docker CLI, especially when the Synology UI falls-short.
I've always put myself in the Docker group to make it easier to manage containers, on Synology it's a tiny bit different than usual.

Add yourself to the `docker` group.
```
# synogroup --add docker <your_username>
```

As well as the Synology-specific group command, you'll need to change the owner of the docker socket.

Change the group of `/var/run/docker.sock` to be `docker`.
```
# chown root:docker /var/run/docker.sock
```

## TLS terminating proxy to Docker containers {#tlsproxy}

Proxying traffic to docker containers via subdomains is really useful.
Even better is if all of that traffic is sat behind TLS.

### Wildcard Let's Encrypt Certs (via acme.sh)

Although Synology has support for automatic Let's Encrypt certificates, it does not support wildcard certs yet, which makes it a bit of a hassle to use when proxying traffic to containers via hostname.

A solution I found for this was to generate a wildcard cert manually, and then using the Synology task scheduler, schedule periodic renewals, and copy the renewed cert into a directory that Synology expects there to be a certificate.

Most of this was pieced together from the [Synology NAS Guide on the acme.sh GitHub Wiki](https://github.com/Neilpang/acme.sh/wiki/Synology-NAS-Guide).

### Set Reverse Proxy routes



## Additional RAM (16GB) {#ram}

Interestingly, and maybe naïvely, I had assumed that if I had DDR3L RAM with the same frequency as the stock 4GB, I'd be good to go...
This is unfortunately not the case, and took some trial and error to find RAM that would allow the thing to boot up.

In the end, this is the RAM that I got working without any trouble:

- [Crucial CT2KIT102464BF160B 16 GB Kit (8 GBx2) (DDR3L, 1600 MT/s, PC3L-12800, SODIMM, 204-Pin) Memory](http://amzn.eu/fvYkJI5)

RAM to avoid would be:

- Corsair Vengeance 16GB Kit (2x8GB) DDR3L 1866MHz (CMSX16GX3M2C1866C11)
