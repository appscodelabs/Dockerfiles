FROM ubuntu:18.04

RUN apt-get update && \
   apt-get install -y curl rpm gettext && \
   curl -Lo /tmp/nfpm_amd64.deb https://github.com/goreleaser/nfpm/releases/download/v0.9.3/nfpm_amd64.deb && \
   dpkg -i /tmp/nfpm_amd64.deb

COPY nfpm.yaml /nfpm.yaml
