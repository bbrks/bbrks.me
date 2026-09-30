ARG HUGO_VERSION=0.167.0

FROM ghcr.io/gohugoio/hugo:v${HUGO_VERSION} AS builder

COPY --chown=hugo:hugo . /project

RUN hugo --gc



FROM caddy:2-alpine

COPY Caddyfile /etc/caddy/Caddyfile
COPY --from=builder /project/public /srv
