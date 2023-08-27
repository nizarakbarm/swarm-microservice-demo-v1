FROM node:0.10

RUN mkdir /app
WORKDIR /app

ADD package.json /app/package.json
RUN rm -rf /node_modules && npm install && npm ls
RUN mv /app/node_modules /node_modules

ADD . /app

ENV PORT 8080
EXPOSE 8080

CMD ["node", "server.js"]