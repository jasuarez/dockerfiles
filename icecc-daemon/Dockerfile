ARG ARCH=amd64
FROM docker.io/${ARCH}/debian:stretch-slim

ENV LANG=en_US.utf8
ENV DEBIAN_FRONTEND=noninteractive

RUN dpkg --add-architecture amd64                                  \
	&& apt-get update                                          \
	&& apt-get install -y icecc build-essential libncurses-dev \
	libssl-dev libelf-dev libudev-dev libpci-dev libiberty-dev \
	qemu-user-static:amd64                                     \
	&& rm -fr /var/lib/apt/lists/*

EXPOSE 10245/tcp
EXPOSE 8766/tcp

ENTRYPOINT iceccd -N ${ICECCD_NAME} -vvv

HEALTHCHECK --interval=5m --timeout=3s \
	CMD curl -f http://0.0.0.0:10245/ || exit 1
