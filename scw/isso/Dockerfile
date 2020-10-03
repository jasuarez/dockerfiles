FROM alpine

RUN apk --no-cache add python3-dev py3-pip py3-wheel gcc libc-dev ca-certificates libffi-dev

RUN pip install isso "werkzeug==0.9"

ADD isso.cfg /etc

VOLUME [ '/isso' ]

EXPOSE 80

ENV ISSO_SETTINGS /etc/isso.cfg

CMD [ "isso", "-c", "/etc/isso.cfg", "run" ]
