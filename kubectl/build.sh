#!/bin/bash
set -x
set -euo pipefail

for ver in 1.7 1.8 1.9 1.10 1.11 1.12 1.13 1.14 1.15 1.16 1.17 1.18
do
	latest=$(curl -fsSL https://storage.googleapis.com/kubernetes-release/release/stable-$ver.txt)

	wget https://dl.k8s.io/$latest/kubernetes-client-linux-amd64.tar.gz \
	  && tar -xzvf kubernetes-client-linux-amd64.tar.gz

	docker build --pull -t appscode/kubectl:$latest .
	docker push appscode/kubectl:$latest

	docker tag appscode/kubectl:$latest appscode/kubectl:v$ver
	docker push appscode/kubectl:v$ver

	docker tag appscode/kubectl:$latest appscode/kubectl:$ver
	docker push appscode/kubectl:$ver

	rm -rf kubernetes kubernetes-client-linux-amd64.tar.gz
done
