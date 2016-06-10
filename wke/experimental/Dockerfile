FROM debian:experimental

MAINTAINER Juan A. Suarez Romero <jasuarez@igalia.com>

RUN apt-get -y update

RUN apt-get -y install sudo git

RUN useradd -m jasuarez 

RUN usermod -G sudo jasuarez

RUN passwd jasuarez -d

USER jasuarez

WORKDIR /home/jasuarez

RUN git clone https://github.com/jasuarez/bashrc.d.git ~/.bashrc.d

RUN /bin/bash ~/.bashrc.d/install

CMD /bin/bash
