# Go to http://localhost/phpreport/install/index.php to initial configuration
# Then open http://localhost/phpreport to use it (username: admin ; password = admin)

FROM ubuntu:14.04

MAINTAINER Juan A. Suarez Romero <jasuarez@igalia.com>

RUN apt-get update

RUN apt-get -y install postgresql apache2 php5 php5-pgsql git supervisor

COPY resources/create_db.sql /tmp

RUN service postgresql start && su postgres -c psql < /tmp/create_db.sql

RUN git clone https://github.com/Igalia/phpreport.git /var/www/html/phpreport

RUN rm -f /tmp/create_db.sql

ADD resources/supervisord.conf /etc/supervisor/conf.d/

EXPOSE 80

CMD ["supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]
    
