+++
title = "Installing multiple Ghost blogs with Lighttpd and forever"
description = ""
date = 2014-01-21T10:56:00Z
draft = false
slug = "multiple-ghost-blogs-lighttpd"
tags = ["guide", "linux", "ghost", "lighttpd"]
aliases = ["multiple-ghost-blogs-lighttpd"]
+++

<div class="alert alert-warning"><strong>Warning!</strong> This guide is out of date/obsolete.</div>

---

This will be a super simple guide on how to quickly install multiple Ghost blogs on a Linux server, running Lighttpd as an internal proxy. This guide also takes you through running Ghost through forever, which ensures it is always running.

You don't need the proxying, but if you don't want to be messing around with port numbers it's the easiest way to set stuff up.

Okay so, first of all, you'll need to install Node.js. This is covered on the [Ghost docs](http://docs.ghost.org/installation/linux/), but I'll reiterate here so it's all in one place.

I'm going to assume you're running a Debian based distro such as Ubuntu for this, however Node is [easily available through many package managers](https://github.com/joyent/node/wiki/Installing-Node.js-via-package-manager).

    # run as root (sudo)
    $ run as non-privileged user

---

Fire up a shell and update your apt repositories and install Node.js:

    # apt-get update
    # apt-get install nodejs

Quickly check that Node installed correctly by running the following:

    $ node -v; npm -v
    v0.10.24
    1.3.21

You may not get the exact versions, as long as it returns a number, you're okay.

Now we're going to download, extract and install Ghost into two directories for our blogs.

    $ curl -L https://ghost.org/zip/ghost-latest.zip -o ghost.zip

    $ mkdir first-blog/
    $ unzip ghost.zip -d first-blog/
    $ npm install --production

    $ mkdir second-blog/
    $ unzip ghost.zip -d second-blog/
    $ npm install --production

We need to configure each of the Ghost installs, so change directories and copy the example config and open up your favourite text editor.

    $ cd first-blog/
    $ cp config.example.js config.js
    $ nano config.js

At this stage, you can optionally configure the Mail settings, just follow the guide on the [Ghost docs](http://docs.ghost.org/mail/).

For each of the blogs, you need to set a unique port number, so find the section that looks like the below and change the port.

    first-blog/config.js
    ---
    production: {
        url: 'http://my-first-blog.com',
        ...
        server: {
            host: '127.0.0.1',
            port: '2368'
        }
    }

Switch to your second install and do the same. Increment the port number by two for your second blog, for example:

    second-blog/config.js
    ---
    production: {
        url: 'http://my-second-blog.com',
        ...
        server: {
            host: '127.0.0.1',
            port: '2370'
        }
    }

---

That's Ghost installed, and they can be accessed by using the port numbers you set, but we want to use the normal domains right?

So next we need to set up an internal proxy server with Lighttpd. This forwards requests from a domain to a specific port.

Go ahead and open up your Lighttpd config and add the following, make sure to check your domain and ports.

    # nano /etc/lighttpd/lighttpd.conf

    server.modules += ( "mod_proxy" )

    $HTTP["host"] == "my-first-blog.com" {
        proxy.server = ( "" => ( (
            "host" => "127.0.0.1",
            "port" => "2368" )
        ) )
    }

    $HTTP["host"] == "my-second-blog.com" {
        proxy.server = ( "" => ( (
            "host" => "127.0.0.1",
            "port" => "2370" )
        ) )
    }

Reload your Lighttpd config with the following

    # service lighttpd force-reload

---

You've got everything you need to run multiple ghost blogs through Lighttpd now, but finally we're going to install Forever which keeps the blogs running in case of any crashes.

First, install Forever through the Node Package Manager.

    # npm install forever -g

Now that's done, we're going to run Ghost and hopefully everything should be working!

    $ NODE_ENV=production forever start first-blog/index.js
    $ NODE_ENV=production forever start second-blog/index.js

If you have any problems, drop me an email at ben@bbrks.me
