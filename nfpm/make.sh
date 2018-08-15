#!/bin/bash
set -xeuo pipefail

docker build -t appscode/nfpm:0.9.3 .
docker push appscode/nfpm:0.9.3
