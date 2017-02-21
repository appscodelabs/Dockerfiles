FROM debian:8.7

ENV DEBIAN_FRONTEND noninteractive
ENV DEBCONF_NONINTERACTIVE_SEEN true

# ref: https://github.com/docker-library/postgres/blob/master/9.5/Dockerfile
# Installs runit and socklog
# make the "en_US.UTF-8" locale so postgres will be utf-8 enabled by default
# change timezone to UTC

RUN set -x \
  && apt-get update \
  && apt-get install -y --no-install-recommends ca-certificates runit socklog locales \
  && apt-get purge -y --auto-remove ca-certificates \
  && rm -rf /var/lib/apt/lists/* /usr/share/doc /usr/share/man /tmp/* \
  && rm -rf /etc/sv /etc/service \
  && localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8 \
  && echo 'Etc/UTC' > /etc/timezone && dpkg-reconfigure tzdata

COPY sv /etc/sv/
COPY runit.sh /runit.sh

ENV TZ     :/etc/localtime
ENV LANG   en_US.utf8
ENV LC_ALL en_US.UTF-8
