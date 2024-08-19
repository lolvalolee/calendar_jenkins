FROM ubuntu:latest
LABEL authors="oleksandr.piskurov"

RUN apt update
RUN apt install -y git npm

WORKDIR /usr/app
COPY ./ /usr/app

RUN npm init -y
RUN npm install express body-parser
RUN npm install --save-dev typescript @types/express nodemon ts-node
RUN npm install -g ts-node typescript '@types/node'

ENTRYPOINT ["ts-node", "typescript-file.ts"]