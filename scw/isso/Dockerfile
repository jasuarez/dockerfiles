FROM alpine

RUN apk --no-cache add python2-dev py2-pip gcc libc-dev ca-certificates

RUN pip install isso gunicorn

ADD isso.cfg /etc

VOLUME [ '/isso' ]

EXPOSE 80

ENV ISSO_SETTINGS /etc/isso.cfg

CMD [ "gunicorn", "-b", "0.0.0.0:80", "-w", "4", "--preload", "isso.run" ]
