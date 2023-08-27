FROM node:0.10
#echo node

RUN mkdir /app
WORKDIR /app

ADD package.json /app/package.json
RUN rm -rf /app/node_modules && rm -rf /node_modules && npm install --force && npm ls
RUN mv /app/node_modules /node_modules

ADD . /app

ENV PORT 8080
EXPOSE 8080

USER 1001
CMD ["node", "server.js"]