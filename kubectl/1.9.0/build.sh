#!/bin/bash
set -x
set -euo pipefail

wget https://dl.k8s.io/v1.9.0/kubernetes-client-linux-amd64.tar.gz \
  && tar -xzvf kubernetes-client-linux-amd64.tar.gz

docker build -t appscode/kubectl:1.9.0 .
docker push appscode/kubectl:1.9.0

rm -rf kubernetes kubernetes-client-linux-amd64.tar.gz
