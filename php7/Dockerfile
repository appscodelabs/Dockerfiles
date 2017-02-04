FROM appscode/base:8.7

RUN set -x \
  && apt-get update \
  && apt-get -y --no-install-recommends install ca-certificates wget

RUN set -x \
  && wget -O - https://www.dotdeb.org/dotdeb.gpg | apt-key add - \
  && echo 'deb http://packages.dotdeb.org jessie all' > /etc/apt/sources.list.d/dotdeb.list \
  && apt-get update \
  && apt-get install -y --no-install-recommends \
    ca-certificates \
    php7.0 \
    php7.0-apcu \
    php7.0-cli \
    php7.0-curl \
    php7.0-fpm \
    php7.0-gd \
    php7.0-gmp libgmp-dev \
    php7.0-imagick \
    php7.0-intl \
    php7.0-json \
    php7.0-ldap \
    php7.0-mcrypt \
    php7.0-pgsql \
    php7.0-mbstring \
  && apt-get purge -y --auto-remove ca-certificates wget \
  && sed -i 's/;date.timezone =/date.timezone ="UTC"/' /etc/php/7.0/fpm/php.ini \
  && sed -i 's/;date.timezone =/date.timezone ="UTC"/' /etc/php/7.0/cli/php.ini \
  && rm -rf /var/lib/apt/lists/* /usr/share/doc /usr/share/man /tmp/*
