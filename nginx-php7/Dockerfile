FROM appscode/php:7

ENV NGINX_VERSION 1.10.1-1~jessie

RUN set -x \
  && apt-key adv --keyserver hkp://pgp.mit.edu:80 --recv-keys 573BFD6B3D8FBC641079A6ABABF5BD827BD9BF62 \
  && echo "deb http://nginx.org/packages/debian/ jessie nginx" >> /etc/apt/sources.list \
  && apt-get update \
  && apt-get install -y ca-certificates nginx=${NGINX_VERSION} gettext-base \
  && sed -i 's/user\ \ nginx;/user\ \ www-data;/' /etc/nginx/nginx.conf \
  && rm -rf /var/lib/apt/lists/* /usr/share/doc /usr/share/man /tmp/*

# forward request and error logs to docker log collector
# http://nginx.org/en/docs/syslog.html

# for php-fpm logs to syslog
RUN sed -i 's/\/var\/log\/php7.0-fpm.log/syslog/' /etc/php/7.0/fpm/php-fpm.conf

# Setup runit scripts
COPY sv /etc/sv/
