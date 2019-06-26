set -xeuo pipefail

docker build --pull -t appscode/alpine-curl:latest .
docker push appscode/alpine-curl:latest