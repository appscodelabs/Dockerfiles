#!/bin/bash

set -o errexit
set -o nounset
set -o pipefail

LIB_ROOT=$(dirname "${BASH_SOURCE}")/..
source "$LIB_ROOT/hack/libbuild/common/lib.sh"
source "$LIB_ROOT/hack/libbuild/common/public_image.sh"

IMG=${PWD##*/}
TAG=8.8
PRIVILEGED_CONTAINER='--privileged=true'
# CAP_SYS_ADMIN was not enough. I got errors like, can't access /dev/fuse

binary_repo $@
