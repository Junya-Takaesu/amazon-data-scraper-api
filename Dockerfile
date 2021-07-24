FROM node:14.17.3

WORKDIR /app
# RUN npm init -y && npm install ronin-server ronin-mocks
COPY ./app .

CMD ["node", "server.js"]