#!/bin/bash

docker stop cids-distribution-switchon

docker rm -v -f cids-distribution-switchon
docker run -it -p 9986:9986 -p 8890:8890 -p 80:80 \
    --name cids-distribution-switchon \
    -v ~/git_work/docker-images-switchon/cids-distribution-switchon/cidsDistribution/server/:/cidsDistribution/server/ \
    -v ~/git_work/docker-images-switchon/cids-distribution-switchon/cidsDistribution/lib/localSwitchon/:/cidsDistribution/lib/localSwitchon/ \
    -v ~/git_work/docker-images-switchon/cids-distribution-switchon/cidsDistribution/client/:/cidsDistribution/client/ \
    switchon/cids-distribution-switchon:latest
    
#    -v ~/git_work/docker-images/cids-distribution/cidsDistribution/cids_ctl.sh:/cidsDistribution/cids_ctl.sh \
#    -v ~/git_work/docker-images/cids-distribution/import/container_ctl.sh:/container_ctl.sh \
#    -v ~/git_work/docker-images-switchon/cids-distribution-switchon/cidsDistribution/client/:/cidsDistribution/client/ \
#    -v ~/git_work/docker-images/cids-distribution/cidsDistribution/utils/:/cidsDistribution/utils/ \
#    -v ~/git_work/docker-images-switchon/cids-distribution-switchon/cidsDistribution/gen/:/cidsDistribution/gen/ \
#    -v ~/git_work/docker-images/cids-distribution/cidsDistribution/utils/:/cidsDistribution/utils/ \