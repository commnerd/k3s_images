FROM alpine as fetcher

RUN apk add git && \
    git clone https://github.com/safing/portmaster.git

RUN cd portmaster && cat cmds/portmaster-core/pack | grep -v GOOS\=windows | grep -v GOOS\=darwin > /tmp/core
RUN chmod +x /tmp/core
RUN mv /tmp/core /portmaster/cmds/portmaster-core/pack
RUN cd portmaster && cat cmds/portmaster-start/pack | grep -v GOOS\=windows | grep -v GOOS\=darwin > /tmp/start
RUN chmod +x /tmp/start
RUN mv /tmp/start /portmaster/cmds/portmaster-start/pack

FROM golang:1.19 as builder

COPY --from=fetcher /portmaster /portmaster

WORKDIR /portmaster

RUN ./pack install

FROM alpine

RUN apk add iptables ip6tables py3-pip && pip install supervisor

COPY --from=builder /portmaster/dist /portmaster

RUN mkdir /data

ADD entrypoint.sh /entrypoint.sh
ADD supervisord.conf /etc/supervisord.conf

ENTRYPOINT [ "/entrypoint.sh" ]

