---
title: "Synology NAS Tips"
description: "Getting a Synology NAS to behave a little more sanely..."
date: 2018-05-15T00:09:10Z
draft: false
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
  1. [Wildcard CNAME DNS entry](#tlsdns)
  2. [Wildcard Let’s Encrypt Certs (via acme.sh)](#lecerts)
  3. [Set Reverse Proxy routes](#proxyroutes)
3. [Additional RAM (16GB)](#ram)

---

## Key-Based SSH Logins {#sshkeys}

This is a must. Being able to disable password login via SSH is a huge security win, and makes my life easier for keys with no passphrase.

I found a great post by [Scott Granneman](https://www.chainsawonatireswing.com/) detailing what it takes to get SSH keys working under DSM, but unfortunately involves a bit of hoop-jumping.
I'll copy the steps that Scott has described in more detail, just for reference's sake:

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

> Could not chdir to home directory /var/services/homes/admin: No such file or directory

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

This one's a bit more involved, but the end result is great...
Unlimited subdomains, all behind a TLS terminating proxy, that routes traffic to docker containers or services running inside DSM.

### Wildcard CNAME DNS entry {#tlsdns}

The details of this step vary depending on your DNS host of choice, but the gist is to add a wildcard `CNAME` record for your NAS.

For example, assuming your NAS was running at `203.0.113.123`:
```
home.bbrks.me.   120 IN A     203.0.113.123
*.home.bbrks.me. 120 IN CNAME home.bbrks.me.
```

This will allow me to use any subdomain to access my NAS over standard HTTP and HTTPS ports, and then route traffic to different containers depending on hostname.

### Wildcard Let's Encrypt Certs (via acme.sh) {#lecerts}

Although Synology has support for automatic Let's Encrypt certificates, it does not support wildcard certs yet, which makes it a bit of a hassle to use when proxying traffic to containers via hostname.

A solution I found for this was to use DSM to generate a certificate for a single hostname with Let's Encrypt, and then replace it with a wildcard cert created manually using [acme.sh](https://github.com/Neilpang/acme.sh).

1. Find all certs stored by DSM and make a note of the IDs:
```
    # find /usr/syno/etc/certificate/_archive/ -maxdepth 1 -mindepth 1 -type d
    /usr/syno/etc/certificate/_archive/LeWbFJ
```

2. Create a new Let's Encrypt cert via DSM for the root domain, and a single subdomain SAN:
```
    Settings > Security > Certificate > Add > Let's Encrypt

    Domain Name: home.bbrks.me
    SAN:         sub.home.bbrks.me
```

3. Make a note of the full path of the newly created certificate, you'll need it later!
```
    # find /usr/syno/etc/certificate/_archive/ -maxdepth 1 -mindepth 1 -type d
    /usr/syno/etc/certificate/_archive/LeWbFJ
    /usr/syno/etc/certificate/_archive/LJ7WA2
```

4. Download and install acme.sh
```sh
    # wget https://github.com/Neilpang/acme.sh/archive/master.tar.gz
    # tar xvf master.tar.gz -C /usr/local/share/acme.sh
    # cd acme.sh-master/
    # ./acme.sh --install --nocron --home /usr/local/share/acme.sh --accountemail "email@example.org"
```

5. Get a new certificate for both your root hostname, and a wildcard subdomain.
```sh
    CERT_DOMAIN="home.bbrks.me" # Your root hostname.
    CERT_PATH="/usr/syno/etc/certificate/_archive/LJ7WA2" # Use the path found in Step 3.
    CERT_DNS="dns_cf" # Using Cloudflare's API, look at options on acme.sh for alternatives

    $ ./acme.sh  --issue \
        -d "$CERT_DOMAIN" \
        -d "*.$CERT_DOMAIN" \
        --dns "$CERT_DNS" \
        --certpath "$CERT_PATH/cert.pem" \
        --keypath "$CERT_PATH/privkey.pem" \
        --fullchainpath "$CERT_PATH/fullchain.pem" \
        --capath "$CERT_PATH/chain.pem" \
        --reloadcmd "/usr/syno/sbin/synoservicectl --reload nginx" \
        --dnssleep 20
```

6. Schedule auto-renewal. The Wiki suggests cron for this, but we can use the Synology Task Scheduler for better integration.
```
    Settings > Task Scheduler > Create > Scheduled Task > User-defined script
    
    Name: LE Wildcard Cert renew
    User: root
    Schedule: Repeat Monthly
    
    User-defined script:
    /usr/local/share/acme.sh/acme.sh --cron --home /usr/local/share/acme.sh/
```

7. Schedule copy. So we have auto-renewing certs in `/usr/local/share/acme.sh/`!
The only missing puzzle piece is to copy these certs into the place DSM expects them to be.
Let's go ahead and create another Scheduled Task to run after the one we created in Step 6.
```
    Settings > Task Scheduler > Create > Scheduled Task > User-defined script

    Name: LE Wildcard Cert copy
    User: root
    Schedule: Repeat Monthly (Time after step 6's task)

    User-defined script: See below.
```
```sh
    # NOTE: $CERTDIR must be hardcoded to the ID you found in Step 3.
    CERTDIR="LJ7WA2"

    # Do not change anything beyond this line!

    CERTROOTDIR="/usr/syno/etc/certificate"
    PACKAGECERTROOTDIR="/usr/local/etc/certificate"
    FULLCERTDIR="$CERTROOTDIR/_archive/$CERTDIR"

    # find all subdirectories containing cert.pem files
    PEMFILES=$(find $CERTROOTDIR -name cert.pem)
    if [ ! -z "$PEMFILES" ]; then
            for DIR in $PEMFILES; do
                    # replace all certificates, but not the ones in the _archive folder
                    if [[ $DIR != *"/_archive/"* ]]; then
                            rsync -avh "$FULLCERTDIR/" "$(dirname $DIR)/"
                    fi
            done
    fi

    # reload
    /usr/syno/sbin/synoservicectl --reload nginx

    # update and restart all installed packages
    PEMFILES=$(find $PACKAGECERTROOTDIR -name cert.pem)
    if [ ! -z "$PEMFILES" ]; then
    	for DIR in $PEMFILES; do
    		rsync -avh "$FULLCERTDIR/" "$(dirname $DIR)/"
    		/usr/syno/bin/synopkg restart $(echo $DIR | awk -F/ '{print $6}')
    	done
    fi
```

Most of this was pieced together from the [Synology NAS Guide on the acme.sh GitHub Wiki](https://github.com/Neilpang/acme.sh/wiki/Synology-NAS-Guide), which may have more detail in some areas, so go check it out!

### Set Reverse Proxy routes {#proxyroutes}

To set up routes to docker containers, you will need to log in to DSM, and go to `Control Panel > Application Portal > Reverse Proxy > Create`.

Under `Source`, you'll be wanting to use the HTTPS protocol, pick a hostname for you to access a docker container with, and the standard port 443.
Under `Destination`, you'll need to specify HTTP, localhost, and the exposed Docker Container port number for the service you wish to proxy to.

In the example of me running an RSS reader on HTTP port 40701 in Docker, I can use the following setup:

```
Description: rss

Source
------
Protocol: HTTPS
Hostname: rss.home.bbrks.me
Port:     443
HSTS:     [x]
HTTP/2:   [x]

Destination
------
Protocol: HTTP
Hostname: localhost
Port:     40701
```

## Additional RAM (16GB) {#ram}

Everyone needs more RAM, especially when [Virtual Machines](https://www.synology.com/en-us/dsm/feature/virtual_machine_manager) and [Docker Containers](https://www.synology.com/en-us/dsm/feature/docker) are treated first-class citizens on Synology DSM.
If you've not yet explored those features, visit those links for a quick overview.

Interestingly, and maybe naïvely, I had assumed that if I had DDR3L RAM with the same frequency as the stock 4GB, I'd be good to go...
This is unfortunately not the case, and took some trial and error to find RAM that would allow the thing to boot up.

In the end, this is the RAM that I got working without any trouble:

- [Crucial CT2KIT102464BF160B 16 GB Kit (8 GBx2) (DDR3L, 1600 MT/s, PC3L-12800, SODIMM, 204-Pin) Memory](http://amzn.eu/fvYkJI5)

RAM to avoid would be:

- Corsair Vengeance 16GB Kit (2x8GB) DDR3L 1866MHz (CMSX16GX3M2C1866C11)
