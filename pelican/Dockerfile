FROM resin/rpi-raspbian

MAINTAINER Juan A. Suarez Romero <jasuarez@igalia.com>


# Install pelican

RUN apt-get update

RUN apt-get -y install git python-pip libpython-dev nginx-light supervisor

RUN pip install pelican Markdown typogrify

RUN mkdir -p /var/www/pelican/ /opt/pelican/content

WORKDIR /opt

RUN git clone https://github.com/getpelican/pelican-themes.git


# Copy samples

ADD resources/content.rst /opt/pelican/content/

ADD resources/settings.py /opt/pelican/settings.py


# Configure nginx

ADD resources/nginx.conf /etc/nginx/sites-available/pelican

ADD resources/nginx-secure.conf /etc/nginx/sites-available/pelican-ssl

RUN rm -f /etc/nginx/sites-enabled/default

RUN ln -sf /etc/nginx/sites-available/pelican /etc/nginx/sites-enabled


# Add cron tasks

ADD resources/update-pelican-content /etc/cron.hourly/

RUN /etc/cron.hourly/update-pelican-content


# Add supervisor settings

ADD resources/supervisord.conf /etc/supervisor/conf.d/


# Expose HTTP

EXPOSE 80


# Start

WORKDIR /opt/pelican

CMD ["supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]

