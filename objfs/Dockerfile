FROM appscode/base:8.7

ENV GCSFUSE_REPO gcsfuse-jessie

RUN set -x \
  && apt-get update \
  && apt-get install -y --no-install-recommends ca-certificates wget \
  && echo "deb http://packages.cloud.google.com/apt $GCSFUSE_REPO main" | tee /etc/apt/sources.list.d/gcsfuse.list \
  && wget -qO- https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add - \
  && apt-get update \
  && apt-get install -y --no-install-recommends gcsfuse \
  # s3fuse
  && apt-get install -y automake autotools-dev g++ git libcurl4-gnutls-dev libfuse-dev libssl-dev libxml2-dev make pkg-config \
  && wget https://github.com/s3fs-fuse/s3fs-fuse/archive/master.tar.gz -O s3fs-fuse.tar.gz \
  && tar xzvf s3fs-fuse.tar.gz \
  && cd s3fs-fuse-master \
  && ./autogen.sh \
  && ./configure \
  && make \
  && make install \
  && cd .. \
  && rm -rf s3fs-fuse* \
  # configure fuse
  && mkdir -p /mnt/data /mnt/auth \
  && echo "user_allow_other" > /etc/fuse.conf \
  # cleanup
  && apt-get purge -y --auto-remove wget \
  && rm -rf /var/lib/apt/lists/* /usr/share/doc /usr/share/man /tmp/*

COPY runit.sh /runit.sh
ENTRYPOINT ['/runit.sh']

# CMD['s3', 'bucket-name', 'gs', 'bucket-name', ...]