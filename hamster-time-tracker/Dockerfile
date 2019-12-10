FROM mageia:7

ARG UID

RUN dnf install -y hamster-time-tracker \
        && dnf clean all

RUN useradd --uid ${UID} local

ADD dbus.conf /etc/dbus-1/session-local.conf

USER local

ENV DBUS_SESSION_BUS_ADDRESS="tcp:host=localhost,bind=*,port=12434"

VOLUME /home/local

CMD [ "dbus-daemon", "--session", "--nofork", "--address=tcp:host=localhost,bind=*,port=12434" ]
