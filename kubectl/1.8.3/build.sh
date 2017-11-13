#!/bin/bash
set -x
set -euo pipefail

wget https://dl.k8s.io/v1.8.2/kubernetes-client-linux-amd64.tar.gz \
  && tar -xzvf kubernetes-client-linux-amd64.tar.gz

docker build -t appscode/who-is-kubeadm:demo .
docker push appscode/who-is-kubeadm:demo

rm -rf kubernetes kubernetes-client-linux-amd64.tar.gz
