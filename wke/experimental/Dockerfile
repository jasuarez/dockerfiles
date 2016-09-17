FROM debian:experimental

MAINTAINER Juan A. Suarez Romero <jasuarez@igalia.com>

ARG username=jasuarez

RUN apt-get -y update

RUN apt-get -y install sudo git vim

RUN useradd -m ${username} 

RUN usermod -G sudo ${username}

RUN passwd ${username} -d

USER ${username}

WORKDIR /home/${username}

RUN git clone https://github.com/jasuarez/bashrc.d.git ~/.bashrc.d

RUN /bin/bash ~/.bashrc.d/install

RUN git clone --recursive https://github.com/jasuarez/vim.d ~/.vim

CMD /bin/bash
