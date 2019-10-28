FROM debian:unstable

ARG username

ARG useruid

ARG usergid

ENV DEBIAN_FRONTEND noninteractive

ENV SHELL /bin/bash

ENV CCACHE_DIR /opt/ccache/cache

RUN apt-get update                                                  \
        && apt-get -y install sudo git wget vim make python python3 \
           python3-pip libtool-bin pkg-config libpciaccess-dev      \
           libxau-dev libpthread-stubs0-dev libwayland-dev          \
           llvm-8-dev libelf-dev bison flex libxext-dev             \
           libxdamage-dev libxxf86vm-dev libxrandr-dev gettext      \
           mesa-utils vulkan-tools ccache bash-completion           \
           libwayland-egl-backend-dev cmake                         \
        && rm -fr /var/lib/apt/lists/*

RUN addgroup --gid ${usergid} ${username}                                    \
        && adduser --gecos "" --uid ${useruid} --gid ${usergid} ${username}  \
        && passwd -d ${username}                                             \
        && adduser ${username} sudo

RUN mkdir -p /opt/jhbuild /opt/ccache

ADD jhbuildrc /home/${username}/.jhbuildrc

ADD setup.sh /home/${username}
        
RUN chown ${username}:${username}    \
        /opt/ccache                  \
        /opt/jhbuild                 \
        /home/${username}/.jhbuildrc \
        /home/${username}/setup.sh

USER ${username}

WORKDIR /home/${username}

RUN sh ./setup.sh            \
        && rm -f ./setup.sh

VOLUME [ "/opt/jhbuild", "/opt/ccache" ]

CMD "/bin/bash"

