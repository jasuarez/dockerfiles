FROM ubuntu:16.04

MAINTAINER Juan A. Suarez Romero <jasuarez@igalia.com>

RUN apt-get update                                                      \
 && apt-get -y install git libspeex-dev libcairo2-dev python3-dev       \
    libgles2-mesa-dev ruby flex libltdl-dev libxrandr-dev libepoxy-dev  \
    libasound2-dev libproxy-dev ragel libp11-kit-dev libgnutls-dev      \
    libvpx-dev libffi-dev libtasn1-6-dev libdbus-1-dev libenchant-dev   \
    libxml2-utils libgphoto2-dev libjson-c-dev libsndfile1-dev          \
    libflac-dev libxkbfile-dev libxml2-dev libhyphen-dev                \
    libavahi-gobject-dev libsqlite3-dev libwavpack-dev gperf            \
    libgcrypt20-dev libtag1-dev libwebp-dev libxtst-dev libxslt1-dev    \
    xsltproc libyaml-dev libtiff5-dev libjpeg-dev intltool bison        \
    libstartup-notification0-dev libarchive-dev itstool libcap-dev      \
    libv4l-dev docbook-xml docbook-xsl valac autopoint uuid-dev         \
    libharfbuzz-dev libpango1.0-dev libatk-bridge2.0-dev libxcb-xkb-dev \
    gtk-doc-tools cmake xutils-dev libxt-dev libsystemd-dev             \
    libdbus-glib-1-dev doxygen ppp-dev libpolkit-agent-1-dev libsbc-dev \
    libgudev-1.0-dev libacl1-dev libudev-dev libatasmart-dev            \
    libxcomposite-dev xmlto libusb-1.0-0-dev libgl1-mesa-dev libusb-dev \
    udev libical-dev libreadline6-dev libbluetooth-dev                  \
 && rm -rf /var/lib/apt/lists/*

RUN adduser --disabled-password --gecos "" epiphany

USER epiphany

COPY jhbuildrc /home/epiphany/.jhbuildrc

RUN git clone git://git.gnome.org/jhbuild /home/epiphany/jhbuild

WORKDIR /home/epiphany/jhbuild

RUN ./autogen.sh && make && make install

WORKDIR /home/epiphany

RUN ~/.local/bin/jhbuild build

RUN rm -fr gnome3/sources

ENTRYPOINT ["/home/epiphany/.local/bin/jhbuild", "run", "epiphany"]
