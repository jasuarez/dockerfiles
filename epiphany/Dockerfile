FROM ubuntu:16.04

MAINTAINER Juan A. Suarez Romero <jasuarez@igalia.com>

RUN apt-get update

RUN apt-get -y install git libspeex-dev libcairo2-dev python3-dev

RUN apt-get -y install libgles2-mesa-dev ruby flex libltdl-dev libxrandr-dev

RUN apt-get -y install libepoxy-dev libasound2-dev libproxy-dev ragel

RUN apt-get -y install libp11-kit-dev libgnutls-dev libvpx-dev libffi-dev

RUN apt-get -y install libtasn1-6-dev libdbus-1-dev libenchant-dev libxml2-utils

RUN apt-get -y install libgphoto2-dev libjson-c-dev libsndfile1-dev libflac-dev

RUN apt-get -y install libxkbfile-dev libxml2-dev libhyphen-dev

RUN apt-get -y install libavahi-gobject-dev libsqlite3-dev libwavpack-dev gperf

RUN apt-get -y install libgcrypt20-dev libtag1-dev libwebp-dev libxtst-dev

RUN apt-get -y install libxslt1-dev xsltproc libyaml-dev libtiff5-dev

RUN apt-get -y install libjpeg-dev intltool bison libstartup-notification0-dev

RUN apt-get -y install libarchive-dev itstool libcap-dev libv4l-dev docbook-xml

RUN apt-get -y install docbook-xsl valac autopoint uuid-dev libharfbuzz-dev

RUN apt-get -y install libpango1.0-dev libatk-bridge2.0-dev libxcb-xkb-dev

RUN apt-get -y install gtk-doc-tools


RUN apt-get -y install cmake xutils-dev libxt-dev libsystemd-dev

RUN apt-get -y install libdbus-glib-1-dev doxygen ppp-dev libpolkit-agent-1-dev

RUN apt-get -y install libsbc-dev libgudev-1.0-dev libacl1-dev libudev-dev

RUN apt-get -y install libatasmart-dev libxcomposite-dev xmlto libusb-1.0-0-dev

RUN apt-get -y install libgl1-mesa-dev libusb-dev

RUN adduser --disabled-password --gecos "" epiphany

USER epiphany

COPY jhbuildrc /home/epiphany/.jhbuildrc

RUN git clone git://git.gnome.org/jhbuild /home/epiphany/jhbuild

WORKDIR /home/epiphany/jhbuild

RUN ./autogen.sh && make && make install

RUN ~/.local/bin/jhbuild build --nodeps


# RUN service postgresql start

# COPY resources/create_db.sql /tmp/

# COPY resources/install.sql /tmp/

# COPY resources/catalina.policy /tmp/

# RUN service postgresql start && su postgres -c psql < /tmp/create_db.sql

# RUN service postgresql start && env PGPASSWORD=libreplan psql -h localhost -U libreplan < /tmp/install.sql

# COPY resources/libreplan.xml /etc/tomcat6/Catalina/localhost/

# COPY resources/libreplan.policy /etc/tomcat6/policy.d/51libreplan.policy

# RUN cat /tmp/catalina.policy >> /etc/tomcat6/policy.d/03catalina.policy

# RUN ln -s /usr/shar/java/postgresql-jdbc3.jar /usr/share/tomcat6/lib/

# ADD http://downloads.sourceforge.net/project/libreplan/LibrePlan/libreplan_1.4.0.war /var/lib/tomcat6/webapps/libreplan.war

# RUN chmod 644 /var/lib/tomcat6/webapps/libreplan.war

# RUN rm -f /tmp/create_db.sql /tmp/install.sql /tmp/catalina.policy

# EXPOSE 8080

# CMD service postgresql start ; service tomcat6 start ; tail -f /var/lib/tomcat6/logs/catalina.out
