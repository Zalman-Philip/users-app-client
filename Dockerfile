FROM node:18-alpine AS builder

WORKDIR /app

COPY package*.json ./
COPY tsconfig*.json ./

RUN npm i 

COPY ./src ./src
COPY ./public ./public

COPY index.html ./
COPY vite.config.ts ./

RUN npm run build && npm cache clean --force

FROM nginx:alpine

COPY --from=builder /app/dist /usr/share/nginx/html

COPY --from=builder /app/src/templates /etc/nginx/templates

CMD [ "nginx", "-g", "daemon off;"]