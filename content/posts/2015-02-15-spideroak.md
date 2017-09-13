+++
title = "A promising start for SpiderOak"
description = ""
date = 2015-02-15T14:17:20Z
draft = false
slug = "spideroak"
aliases = ["spideroak"]
image = "/images/2015/02/SpiderOak-Google-Plus-Cover-Image.jpg"
+++

[Updated: 2015-02-23](#update)

---

Following up from my previous post, [Dropbox, I love you but you're bringing me down](http://bbrks.me/farewell-dropbox/). I have been trying out [SpiderOak](https://spideroak.com) to backup and sync my files rather than settling rather unhappily for Google Drive.

The whole premise of SpiderOak is that it encrypts files locally on your machine before it uploads them. By doing this, in theory, only you are able to read your files.

There is one thing to note upfront, SpiderOak does not have user-friendliness in mind. However it does have a huge emphasis on security and privacy and I'd be willing to sacrifice UX with a slight cost increase in order to store my files securely. Rather than a single directory for your files to sit in. It has a concept of backups and sync folders.

The two are seperate, which means you can backup files without sharing them across multiple machines. It does take some set up, but once it's done, it's a much better system than Dropbox/Google Drive.

For example, this is my home directory. I am backing up my archived documents, my ebooks, design, dev, uni and work directories. As these contain my important files. Anything else, I can afford to lose.

![](/posts/images/2015/02/Screen-Shot-2015-02-15-at-14-09-37.png)

So, these are backed up, but in order to sync them to another machine. I need to set up a Sync folder. By default, one exists called 'Hive' which is synced to all machines. This is similar to Dropbox/Google Drive, and you could just use that. But if you wish to have more control, you may want to set up additional sync folders.

---

First, let's have a look at what SpiderOak offers in comparison to Google Drive.

<div style="overflow:scroll">
  <table style="white-space: nowrap">
      <tr>
          <th>Service</th>
          <th><a href="https://spideroak.com">SpiderOak</a></th>
          <th><a href="http://drive.google.com">Google Drive</a></th>
      </tr>
      <tr>
          <th>Encryption</th>
          <td>Full Client-Side encryption</td>
          <td>Server-Side encryption but <a href="http://techland.time.com/2012/04/26/will-google-drive-snoop-inside-your-data-google-needs-to-be-clearer/">data-mined</a></td>
      </tr>
      <tr>
          <th>Client</th>
          <td>Closed source, no ARM client</td>
          <td>Closed source, No Linux client</td>
      </tr>
      <tr>
          <th>2GB</th>
          <td>$0</td>
          <td>$0</td>
      </tr>
      <tr>
          <th>5GB</th>
          <td>$0 <em>('<strong>hurricanesafe</strong>' promo code)</em></td>
          <td>$0</td>
      </tr>
      <tr>
          <th>15GB</th>
          <td>-</td>
          <td>$0</td>
      </tr>
      <tr>
          <th>30GB</th>
          <td>$79/yr <em>or</em> $7/mo</td>
          <td>-</td>
      </tr>
      <tr>
          <th>100GB</th>
          <td>$75/yr <em>('<strong>spring</strong>' promo code)</em></td>
          <td>$1.99/mo</td>
      </tr>
      <tr>
          <th>1TB</th>
          <td>$129/yr <em>or</em> $12/mo</td>
          <td>$9.99/mo</td>
      </tr>
      <tr>
          <th>5TB</th>
          <td>$279/yr <em>or</em> $25/mo</td>
          <td>-</td>
      </tr>
      <tr>
          <th>10TB</th>
          <td>-</td>
          <td>$99.99/mo</td>
      </tr>
      <tr>
          <th>20TB</th>
          <td>-</td>
          <td>$199.99/mo</td>
      </tr>
      <tr>
          <th>30TB</th>
          <td>-</td>
          <td>$299.99/mo</td>
      </tr>
  </table>
</div>

As you can see, price wise SpiderOak is the expensive option until you start looking above 1TB. If you're wanting to back up over 5TB online, I'd definitely consider other options, potentially even self-hosted if you're looking to pay $3600 a year.

Unfortunatley both clients are closed source, this means any security promises they make you have to take with a pinch of salt. Sadly there is also no ARM client for SpiderOak either, so you can rule out using your Raspberry Pi, or ARM based file server with it.

For now, I am using SpiderOak, but patiently waiting for the ARM client before I decide to pour any money into it. I could really do with it working on my NAS.

---

### <a name="update">Update: 2015-02-23</a>

Following up on the post above, I have been using SpiderOak for a week now. I have one critisism with it. It is ***incredibly*** slow at uploading many files, as it encrypts files in small groups before uploading. This means that it can only upload one set of encrypted files at a time. If this process were parallelised, it would be much faster, as the bottleneck is definitely not my connection's upload speed.

I have been running a Sync operation for over a week solid, so 170+ hours on a dataset of approximately 500GB, mostly consisting of files about 20-30MB in size. If I were uploading them at full speed, it would take a little under 60 hours to complete. But it is currently only 45% done at 170 hours.

So, at the minute, uploading to SpiderOak has approximately 3Mb/s upload rate, which is just 16% of my upload speed.

Once this upload is done once, it will be fine, as only files that are changed and not duplicated need to be re-uploaded. With that said, the initial upload is painfully slow!
