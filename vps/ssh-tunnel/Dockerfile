FROM alpine

RUN apk --no-cache add openssh-server shadow netcat-openbsd

RUN ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key  -N ""

RUN ssh-keygen -t dsa -f /etc/ssh/ssh_host_dsa_key  -N ""

RUN ssh-keygen -t ecdsa -f /etc/ssh/ssh_host_ecdsa_key  -N ""

RUN ssh-keygen -t ed25519 -f /etc/ssh/ssh_host_ed25519_key  -N ""

RUN adduser -D client && usermod -p '*' client

RUN adduser -D server && usermod -p '*' server

VOLUME [ "/etc/ssh" ]

EXPOSE 22

CMD [ "/usr/sbin/sshd", "-D", "-e" ]
