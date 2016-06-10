FROM fedora:rawhide

MAINTAINER Juan A. Suarez Romero <jasuarez@igalia.com>

RUN dnf -y install git sudo passwd

RUN useradd -m jasuarez 

RUN usermod -G wheel jasuarez

RUN passwd jasuarez -d

USER jasuarez

WORKDIR /home/jasuarez

RUN git clone https://github.com/jasuarez/bashrc.d.git ~/.bashrc.d

RUN /bin/bash ~/.bashrc.d/install

CMD /bin/bash
