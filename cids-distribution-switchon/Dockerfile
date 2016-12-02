FROM cismet/cids-distribution:latest

MAINTAINER Pascal Dihé <pascal.dihe@cismet.de>

LABEL de.cismet.cids.distribution.switchon.name="cids-distribution-switchon image" \
      de.cismet.cids.distribution.switchon.version="cidsDistributionSwitchon-1.0" \
      de.cismet.cids.distribution.switchon.descripton="cids SWITCH-ON Distribution Runtime Image"

ENV CIDS_ACCOUNT_EXTENSION="Switchon"
ENV CIDS_LOCAL_DIR ${CIDS_LIB_DIR}/local${CIDS_ACCOUNT_EXTENSION}
ENV CIDS_STARTER_DIR ${CIDS_LIB_DIR}/starter${CIDS_ACCOUNT_EXTENSION}

EXPOSE 9986
EXPOSE 8890

# use .dockerignore to control which files go into the image and which not (faster!)
COPY cidsDistribution ${CIDS_DISTRIBUTION_DIR}/

# local libs are required during image build time
# don't add cidsDistribution/lib/.local.templates to .dockerignore in order to make this work
COPY cidsDistribution/lib/.local.templates ${CIDS_LOCAL_DIR}/

# optional: copy local maven repository to speed up image generation 
# COPY ~/.m2/repository ${MAVEN_LIB_DIR}

RUN ${CIDS_DISTRIBUTION_DIR}/utils/build_autodistribution.sh

# brute force signing :-(!
RUN ${CIDS_DISTRIBUTION_DIR}/utils/sign_all.sh

RUN rm -rf ${CIDS_DISTRIBUTION_DIR}/lib/.local.templates
RUN rm -rf ${CIDS_DISTRIBUTION_DIR}/.private
RUN rm -rf ${CIDS_GENERATOR_DIR}

# add /tmp as volume since it may contain data that changes often 
VOLUME /tmp