FROM appscode/base:8.7

# TODO: review this dependency list
RUN set -x \
  && apt-get update \
  && apt-get install -y --no-install-recommends \
    ca-certificates \
    libgmp-dev \
    php-apc \
    php5 \
    php5-apcu \
    php5-cli \
    php5-curl \
    php5-fpm \
    php5-gd \
    php5-gmp \
    php5-imagick \
    php5-intl \
    php5-json \
    php5-ldap \
    php5-mcrypt \
    php5-pgsql \
  && apt-get purge -y --auto-remove ca-certificates \
  && sed -i 's/;date.timezone =/date.timezone ="UTC"/' /etc/php5/fpm/php.ini \
  && sed -i 's/;date.timezone =/date.timezone ="UTC"/' /etc/php5/cli/php.ini \
  && rm -rf /var/lib/apt/lists/* /usr/share/doc /usr/share/man /tmp/*
