FROM bash:5.2.15

RUN apk add bash curl openssh-client

ADD loophole-reboots.sh /usr/local/bin

VOLUME /root/.ssh

CMD [ '/usr/local/bin/loophole-reboots.sh' ]
