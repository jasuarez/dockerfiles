# Go to http://localhost/phpreport to use it (username: admin ; password = admin)

FROM ubuntu:bionic

MAINTAINER Juan A. Suarez Romero <jasuarez@igalia.com>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update

RUN apt-get -y install postgresql apache2 php php-pgsql php-xml supervisor

ADD https://github.com/Igalia/phpreport/releases/download/2.18/phpreport_2.18.tar.gz /var/www/html/phpreport/

WORKDIR  /var/www/html/phpreport/

RUN tar -xvf phpreport_2.18.tar.gz

COPY resources/create_db.sql /tmp

RUN service postgresql start && su postgres -c psql < /tmp/create_db.sql

RUN service postgresql start && env PGPASSWORD='phpreport' psql -h localhost -U phpreport phpreport < /var/www/html/phpreport/sql/schema.sql

RUN service postgresql start && env PGPASSWORD='phpreport' psql -h localhost -U phpreport phpreport < /var/www/html/phpreport/sql/uniqueConstraints.sql

RUN service postgresql start && env PGPASSWORD='phpreport' psql -h localhost -U phpreport phpreport < /var/www/html/phpreport/sql/otherConstraints.sql

RUN service postgresql start && env PGPASSWORD='phpreport' psql -h localhost -U phpreport phpreport < /var/www/html/phpreport/sql/initialData.sql

RUN service postgresql start && env PGPASSWORD='phpreport' psql -h localhost -U phpreport phpreport < /var/www/html/phpreport/sql/update/all.sql

RUN rm -f /tmp/create_db.sql

RUN cp /var/www/html/phpreport/config/config.defaults /var/www/html/phpreport/config/config.php

ADD resources/supervisord.conf /etc/supervisor/conf.d/

VOLUME /var/lib/postgresql/

EXPOSE 80

CMD ["supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]
