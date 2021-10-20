FROM alpine:3.13.6

LABEL image.author="commnerd@gmail.com"
LABEL image.version="1.0.4"

ENV AUTH_KEY_FILE=id_rsa
ENV BIND_PORT=80
ENV DEST=localhost
ENV DEST_PORT=80
ENV USER=user
ENV SERVER=test.com

RUN apk add --no-cache openssh-client bash

COPY connect.sh /

VOLUME /tmp/.ssh

ENTRYPOINT [ "/connect.sh" ]
