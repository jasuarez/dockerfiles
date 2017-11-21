# Inspired by https://github.com/clue/docker-ttrss

FROM resin/rpi-raspbian

MAINTAINER Juan A. Suarez Romero <jasuarez@igalia.com>


# Install dependencies

RUN apt-get update

RUN apt-get -y install git nginx-light php5-cli php5-fpm php5-pgsql postgresql supervisor


# Install TTRSS

RUN git clone --depth 1 https://github.com/gothfox/Tiny-Tiny-RSS.git /var/www/ttrss

WORKDIR /var/www/ttrss

RUN cp config.php-dist config.php

RUN sed -i -e "/'SELF_URL_PATH'/s/ '.*'/ 'https:\/\/localhost\/'/" config.php

RUN chown www-data:www-data -R /var/www


# Configure nginx

ADD resources/server.crt /etc/nginx/ssl/

ADD resources/server.key /etc/nginx/ssl/

ADD resources/nginx-secure.conf /etc/nginx/sites-available/ttrss

RUN rm -f /etc/nginx/sites-enabled/default

RUN ln -sf /etc/nginx/sites-available/ttrss /etc/nginx/sites-enabled


# Configure TTRSS DB

ADD resources/configure-db.sh /

RUN . /configure-db.sh

ADD resources/run_postgresql.sh /usr/bin/

RUN chmod 755 /usr/bin/run_postgresql.sh


# Run everything

EXPOSE 443

ADD resources/supervisord.conf /etc/supervisor/conf.d/

CMD ["supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]

