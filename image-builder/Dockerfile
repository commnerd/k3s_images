FROM alpine:3.13.6

LABEL image.author="commnerd@gmail.com"
LABEL image.version="0.0.1"

ENV AUTH_KEY_FILE=id_rsa
ENV BRANCH=master

RUN apk add --no-cache docker git make

COPY build.sh /

ENTRYPOINT [ "/build.sh" ]
