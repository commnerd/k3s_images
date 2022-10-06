FROM node

ENV USER admin
ENV PASS abcdefg

RUN mkdir /project

ADD script.js /project

WORKDIR /project

RUN npm install -g mocha && npm install selenium selenium-webdriver chromedriver

CMD [ 'PATH=$PATH:/project/node_modules/chromedriver/bin mocha script.js' ]
