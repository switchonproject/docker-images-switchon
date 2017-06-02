#!/bin/bash

# add --squash build flag available to remove .private data from image history
# See https://github.com/docker/docker/pull/22641#issuecomment-266156133

# brute force invalidate complete cache
#docker build -t switchon/cids-distribution-switchon:latest --no-cache=true .

# set build timestamp to selectively invalidate cache after dockerfile instruction
# RELEASE BUILD
#docker build --squash -t switchon/cids-distribution-switchon:latest -t switchon/cids-distribution-switchon:5.0 --build-arg expire_after=$(date +%Y-%m-%d:%H:%M:%S) .

# DEV BUILD
docker build -t switchon/cids-distribution-switchon:5.0-SNAPSHOT -t switchon/cids-distribution-switchon:latest-snapshot --build-arg expire_after=$(date +%Y-%m-%d:%H:%M:%S) .