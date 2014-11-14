FROM ubuntu:14.04

MAINTAINER Juan A. Suarez Romero <jasuarez@igalia.com>

RUN apt-get update

RUN apt-get -y install openjdk-6-jre postgresql postgresql-client tomcat6 libpg-java cutycapt xvfb supervisor

RUN service postgresql start

COPY resources/create_db.sql /tmp/

COPY resources/install.sql /tmp/

COPY resources/catalina.policy /tmp/

RUN service postgresql start && su postgres -c psql < /tmp/create_db.sql

RUN service postgresql start && env PGPASSWORD=libreplan psql -h localhost -U libreplan < /tmp/install.sql

COPY resources/libreplan.xml /etc/tomcat6/Catalina/localhost/

COPY resources/libreplan.policy /etc/tomcat6/policy.d/51libreplan.policy

RUN cat /tmp/catalina.policy >> /etc/tomcat6/policy.d/03catalina.policy

RUN ln -s /usr/share/java/postgresql-jdbc3.jar /usr/share/tomcat6/lib/

ADD http://downloads.sourceforge.net/project/libreplan/LibrePlan/libreplan_1.4.0.war /var/lib/tomcat6/webapps/libreplan.war
#COPY resources/libreplan.war /var/lib/tomcat6/webapps/

RUN chmod 644 /var/lib/tomcat6/webapps/libreplan.war

RUN rm -f /tmp/create_db.sql /tmp/install.sql /tmp/catalina.policy

EXPOSE 8080

CMD service postgresql start ; service tomcat6 start ; tail -f /var/lib/tomcat6/logs/catalina.out
