#!/bin/bash

docker stop cids-distribution-switchon

docker rm -v -f cids-distribution-switchon
docker run -it --name cids-distribution-switchon \
    -v ~/git_work/docker-images-switchon/cids-distribution-switchon/cidsDistribution/client/:/cidsDistribution/client/ \
    -v ~/git_work/docker-images-switchon/cids-distribution-switchon/cidsDistribution/server/:/cidsDistribution/server/ \
    -v ~/git_work/docker-images-switchon/cids-distribution-switchon/cidsDistribution/lib/local/:/cidsDistribution/lib/local/ \
    -v ~/git_work/docker-images/cids-distribution/cidsDistribution/utils/:/cidsDistribution/utils/ \
    switchon/cids-distribution-switchon:latest

#    -v ~/git_work/docker-images-switchon/cids-distribution-switchon/cidsDistribution/utils/:/cidsDistribution/utils/ \
#    -v ~/git_work/docker-images-switchon/cids-distribution-switchon/cids_ctl.sh:/cidsDistribution/cids_ctl.sh \