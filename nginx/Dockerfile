FROM appscode/base:8.8

ENV NGINX_VERSION 1.10.3-1~jessie

RUN set -x \
  && apt-key adv --keyserver hkp://pgp.mit.edu:80 --recv-keys 573BFD6B3D8FBC641079A6ABABF5BD827BD9BF62 \
  && echo "deb http://nginx.org/packages/debian/ jessie nginx" >> /etc/apt/sources.list \
  && apt-get update \
  && apt-get install -y ca-certificates nginx=${NGINX_VERSION} gettext-base \
  && sed -i 's/user\ \ nginx;/user\ \ www-data;/' /etc/nginx/nginx.conf \
  && rm -rf /var/lib/apt/lists/* /usr/share/doc /usr/share/man /tmp/*

# Since nginx is expected to serve only static files (images, precompiled backbone app)
# runit is necessary. So, logs are sent to stdout and stderr instead of passing to syslog(socklog).
# If runit is used, then pass logs directly to syslog(socklog).
# forward request and error logs to docker log collector
RUN ln -sf /dev/stdout /var/log/nginx/access.log \
    && ln -sf /dev/stderr /var/log/nginx/error.log

CMD ["nginx", "-g", "daemon off;"]
EXPOSE 80
