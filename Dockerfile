FROM ubuntu:20.04

ARG VERSION
ARG PLATFORM

RUN apt-get update && \
  apt-get install -y git python3

WORKDIR /toolkit
RUN git clone https://github.com/SynologyOpenSource/pkgscripts-ng && \
  ./pkgscripts-ng/EnvDeploy -v $VERSION -p $PLATFORM && \
  ./pkgscripts-ng/EnvDeploy -v $VERSION -l

WORKDIR /toolkit/build_env/ds.$PLATFORM-$VERSION
COPY chroot/ ./
ADD https://raw.githubusercontent.com/sunnyone/synouidmod/master/synouidmod.c ./tmp
RUN cp /toolkit/pkgscripts-ng/include/platform.$PLATFORM ./tmp/platform.env && \
  chroot . /bin/bash -c ". /tmp/build.sh" && \
  cp ./tmp/synouidmod /tmp
