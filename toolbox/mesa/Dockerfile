FROM ubuntu:24.04

LABEL com.github.containers.toolbox="true"  \
      com.github.debarshiray.toolbox="true" \
      maintainer="Juan A. Suarez <jasuarez@igalia.com>"

COPY packages /
RUN apt update
RUN cat /packages | DEBIAN_FRONTEND=noninteractive xargs apt -yq install
RUN apt clean
RUN rm /packages

RUN userdel -r ubuntu

ENV CONTAINER_NAME mesa

CMD /usr/bin/bash
