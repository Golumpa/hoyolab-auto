FROM node:20-alpine

WORKDIR /app

COPY ["package.json", "./"]
RUN npm install --omit=dev

COPY . .

RUN addgroup -S hoyolab && adduser -S -G hoyolab hoyolab && \
    mkdir -p /app/data && \
    chown -R hoyolab:hoyolab /app \
    mv /app/default.config.js /app/config.js

USER hoyolab

ENV TZ=Asia/Shanghai

CMD ["npm", "start"]
