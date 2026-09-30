# [bbrks.me](https://bbrks.me)

Sources used to generate [bbrks.me](https://bbrks.me)

Built with [Hugo](https://gohugo.io) (version set in the `Dockerfile`), using the
[gruvbox theme](https://github.com/bbrks/hugo-gruvbox-theme) (`bbrks.me` branch) as a submodule.

## Building

```
$ git submodule update --init
$ make
```

See more build instructions with `make help`

## Docker

The `Dockerfile` builds the site with the official Hugo image, then serves it with
[Caddy](https://caddyserver.com) on port 80 (see `Caddyfile`). TLS is left to the
reverse proxy in front of it.

CI pushes `bbrks/bbrks.me:latest` (and a `sha-<commit>` tag) to Docker Hub on every push to `master`.

Example for [caddy-docker-proxy](https://github.com/lucaslorentz/caddy-docker-proxy):

```yaml
services:
  bbrks.me:
    image: bbrks/bbrks.me:latest
    restart: unless-stopped
    networks: [caddy]
    labels:
      caddy: bbrks.me
      caddy.reverse_proxy: "{{upstreams 80}}"
```
