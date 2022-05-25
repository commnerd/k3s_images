FROM node

RUN rm -fR /opt/* && \
    apt update && \npm install -g npm@latest && \
    npm install -g @angular/cli && \
    git clone https://github.com/commnerd/maikr.git /opt/maikr && \
    rm -fR /opt/maikr/.git && \
    rm -fR /opt/maikr/srv && \
    cd /opt/maikr/ui && \
    npm install

WORKDIR /opt/maikr/ui

ENTRYPOINT ng serve
