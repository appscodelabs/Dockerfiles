set -xeuo pipefail

docker build --pull -t appscode/alpine-telnet:latest .
docker push appscode/alpine-telnet:latest