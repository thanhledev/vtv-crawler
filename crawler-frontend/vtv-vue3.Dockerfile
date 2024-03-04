# build stage
FROM node:18-alpine AS build-stage
WORKDIR /vue_app
ARG VUE_MODE
COPY package.json .
RUN npm install
COPY . .
RUN npm run $VUE_MODE

# production stage
FROM nginx AS production-stage
COPY --from=build-stage /vue_app/dist /usr/share/nginx/html
COPY --from=build-stage /vue_app/proxy/nginx.conf /etc/nginx/conf.d/default.conf
EXPOSE 8080
CMD ["nginx", "-g", "daemon off;"]