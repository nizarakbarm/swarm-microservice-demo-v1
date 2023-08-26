FROM node:0.10.36

RUN mkdir /app
WORKDIR /app

ADD package.json /app/package.json
RUN npm install && npm ls
RUN cp /app/node_modules /node_modules

ADD . /app

ENV PORT 8080
EXPOSE 8080

USER 1001
CMD ["node", "server.js"]