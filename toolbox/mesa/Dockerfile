FROM ubuntu:20.04

LABEL com.github.containers.toolbox="true"  \
      com.github.debarshiray.toolbox="true" \
      maintainer="Juan A. Suarez <jasuarez@igalia.com>"

ENV CONTAINER_NAME mesa

COPY packages /
RUN apt update
RUN cat /packages | DEBIAN_FRONTEND=noninteractive xargs apt -yq install
RUN apt clean
RUN rm /packages

RUN apt-file update

CMD /usr/bin/bash
