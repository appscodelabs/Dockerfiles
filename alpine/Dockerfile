FROM alpine:3.5

# ref: https://github.com/docker-library/postgres/blob/master/9.5/Dockerfile
# Installs runit and socklog
# make the "en_US.UTF-8" locale so postgres will be utf-8 enabled by default
# change timezone to UTC

RUN set -x \
  && apk update \
  && apk add ca-certificates runit socklog tzdata \
  && rm -rf /var/cache/apk/* \
  && rm -rf /etc/sv /etc/service \
  && echo 'Etc/UTC' > /etc/timezone

COPY sv /etc/sv/
COPY runit.sh /runit.sh

ENV TZ     :/etc/localtime
ENV LANG   en_US.utf8
