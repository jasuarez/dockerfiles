FROM alpine

RUN apk --no-cache add python3-dev py3-pip py3-wheel gcc libc-dev ca-certificates libffi-dev

RUN pip install isso gunicorn werkzeug

ADD isso.cfg /etc

VOLUME [ "/isso" ]

EXPOSE 80

ENV ISSO_SETTINGS /etc/isso.cfg

CMD [ "gunicorn", "-b", "0.0.0.0:80", "-w", "4", "--preload", "isso.run" ]
