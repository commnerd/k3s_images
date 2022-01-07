FROM alpine:3.13.6

LABEL image.author="commnerd@gmail.com"
LABEL image.version="1.0.3"

RUN apk add --no-cache bash curl aws-cli

ADD monitor.sh /

ENTRYPOINT [ "/monitor.sh" ]
