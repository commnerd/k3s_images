FROM node

ENV MONGO_USER  user
ENV MONGO_PASS  pass
ENV MONGO_URL   mongodb
ENV MONGO_TABLE admin

RUN rm -fR /opt/* && \
    apt update && \npm install -g npm@latest && \
    npm install -g @angular/cli && \
    git clone https://github.com/commnerd/maikr.git /opt/maikr && \
    rm -fR /opt/maikr/.git && \
    rm -fR /opt/maikr/ui && \
    cd /opt/maikr/srv && \
    npm install

WORKDIR /opt/maikr/srv

ENTRYPOINT npm run serve
