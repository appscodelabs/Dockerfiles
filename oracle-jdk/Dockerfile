FROM appscode/base:8.7

# Install Java 8 JDK
RUN set -x \
  && echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections \
  && echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" >> /etc/apt/sources.list.d/webupd8team-java.list \
  && echo "deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" >> /etc/apt/sources.list.d/webupd8team-java.list \
  && apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys EEA14886 \
  && apt-get update \
  && apt-get install -y --no-install-recommends ca-certificates oracle-java8-installer \
  && apt-get install -y --no-install-recommends oracle-java8-set-default \
  && apt-get purge -y --auto-remove ca-certificates \
  && rm -rf /var/lib/apt/lists/* /usr/share/doc /usr/share/man /tmp/* \
  && rm -rf /var/cache/oracle-jdk8-installer

# Define commonly used JAVA_HOME variable
ENV JAVA_HOME /usr/lib/jvm/java-8-oracle
