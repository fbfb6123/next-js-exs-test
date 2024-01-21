FROM node:19.4.0-alpine  
WORKDIR /app
COPY ./src/app/package.json ./
RUN npm install