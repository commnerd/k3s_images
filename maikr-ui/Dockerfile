FROM node as builder

RUN rm -fR /opt/* && \
    apt update && \npm install -g npm@latest && \
    npm install -g @angular/cli && \
    git clone https://github.com/commnerd/maikr.git /tmp/maikr && \
    cd /tmp/maikr/ui && \
    npm install && \
    ng build

FROM nginx:1.22.0

COPY --from=builder /tmp/maikr/ui/dist/maikr/* /usr/share/nginx/html

ADD api_updater.sh /docker-entrypoint.d
