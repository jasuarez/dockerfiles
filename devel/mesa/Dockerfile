FROM debian:unstable

ENV DEBIAN_FRONTEND noninteractive

ENV SHELL /bin/bash

RUN apt-get update                                                  \
        && apt-get -y install sudo git wget vim make python python3 \
           python3-pip libtool-bin pkg-config libpciaccess-dev      \
           libxau-dev libpthread-stubs0-dev libwayland-dev          \
           llvm-8-dev libelf-dev bison flex libxext-dev             \
           libxdamage-dev libxxf86vm-dev libxrandr-dev gettext      \
	   mesa-utils  vulkan-tools                                 \
        && rm -fr /var/lib/apt/lists/*

RUN addgroup --gid 1002 jasuarez                              \
        && adduser --gecos "" --uid 1000 --gid 1002 jasuarez  \
        && passwd -d jasuarez                                 \
        && adduser jasuarez sudo

RUN mkdir -p /opt/jhbuild

ADD jhbuildrc /home/jasuarez/.jhbuildrc

ADD setup.sh /home/jasuarez
        
RUN chown jasuarez:jasuarez       \
        /opt/jhbuild              \
        /home/jasuarez/.jhbuildrc \
        /home/jasuarez/setup.sh

USER jasuarez

WORKDIR /home/jasuarez

RUN sh ./setup.sh            \
        && rm -f ./setup.sh

VOLUME "/opt"

CMD "/bin/bash"
