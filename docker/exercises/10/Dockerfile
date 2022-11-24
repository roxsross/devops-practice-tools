FROM node:16-alpine

LABEL project="Reto05"

WORKDIR /home/node/app

COPY ./hello-bootcamp/package*.json ./

RUN npm install

COPY ./hello-bootcamp/ ./

EXPOSE 4000

USER node

CMD ["npm","start"]