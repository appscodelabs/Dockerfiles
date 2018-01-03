#!/bin/bash
set -x
set -euo pipefail

wget https://dl.k8s.io/v1.8.6/kubernetes-client-linux-amd64.tar.gz \
  && tar -xzvf kubernetes-client-linux-amd64.tar.gz

docker build -t appscode/kubectl:1.8.6 .
docker push appscode/kubectl:1.8.6

rm -rf kubernetes kubernetes-client-linux-amd64.tar.gz
