FROM appscode/base:8.8

RUN set -x \
  && apt-get update \
  && apt-get -y --no-install-recommends install ca-certificates wget apt-transport-https lsb-release

RUN set -x \
  && wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg \
  && echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/php.list \
  && apt-get update \
  && apt-get install -y --no-install-recommends \
    php7.1 \
    php-pear \
    php7.1-apcu \
    php7.1-cli \
    php7.1-curl \
    php7.1-fpm \
    php7.1-gd \
    php7.1-gmp \
    libgmp-dev \
    php7.1-imagick \
    php7.1-intl \
    php7.1-json \
    php7.1-ldap \
    php7.1-mcrypt \
    php7.1-pgsql \
    php7.1-mbstring \
  && apt-get purge -y --auto-remove wget \
  && sed -i 's/;date.timezone =/date.timezone ="UTC"/' /etc/php/7.1/fpm/php.ini \
  && sed -i 's/;date.timezone =/date.timezone ="UTC"/' /etc/php/7.1/cli/php.ini \
  && rm -rf /var/lib/apt/lists/* /usr/share/doc /usr/share/man /tmp/*

RUN mkdir /var/run/php
RUN service php7.1-fpm restart