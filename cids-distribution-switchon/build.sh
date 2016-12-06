#!/bin/bash

# brute force invalidate complete cache
#docker build -t switchon/cids-distribution-switchon:latest --no-cache=true .

# set build timestamp to selectively invalidate cache after dockerfile instruction
docker build -t switchon/cids-distribution-switchon:latest --build-arg expire_after=$(date +%Y-%m-%d:%H:%M:%S) .