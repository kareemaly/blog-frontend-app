FROM node:16-alpine as main

WORKDIR /app

ENV CI true

COPY package.json ./
COPY yarn.lock ./
RUN yarn install --immutable

COPY . .

##############
# Test stage #
##############
FROM main as test

WORKDIR /app
RUN yarn test

###############
# Build stage #
###############
FROM main as build

WORKDIR /app
RUN yarn build
