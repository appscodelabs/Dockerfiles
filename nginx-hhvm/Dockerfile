FROM tigerworks/ubuntu:15.04

# Install HHVM and nginx.
RUN \
  apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0x5a16e7281be7a449 && \
  add-apt-repository 'deb http://dl.hhvm.com/ubuntu vivid main' && \
  add-apt-repository -y ppa:nginx/stable && \
  apt-get update && \
  apt-get install -y hhvm nginx && \
  /usr/share/hhvm/install_fastcgi.sh && \
  /usr/bin/update-alternatives --install /usr/bin/php php /usr/bin/hhvm 60 && \
  sed -i s/mode\ daemon/mode\ server/g /etc/init.d/hhvm && \
  rm /var/www/html/*

# Setup runit scripts
ADD sv /etc/sv/
RUN \
  chmod a+x /etc/sv/*/run && \
  ln -s /etc/sv/nginx /etc/service/nginx && \
  ln -s /etc/sv/hhvm /etc/service/hhvm

# Update nginx site configuraiton and add website content
ADD default /etc/nginx/sites-available/default
ADD index.php /var/www/html/index.php

ENTRYPOINT ["/usr/sbin/runsvdir-start"]
EXPOSE 80
