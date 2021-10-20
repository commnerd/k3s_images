FROM docker:dind

LABEL image.author="commnerd@gmail.com"
LABEL image.version="0.0.2"

ENV AUTH_KEY_FILE=id_rsa
ENV BRANCH=master

RUN apk add --no-cache git make

COPY build.sh /

ENTRYPOINT [ "/build.sh" ]
