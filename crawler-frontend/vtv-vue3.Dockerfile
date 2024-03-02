# build stage
FROM node:18-alpine AS build-stage
WORKDIR /vue_app
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# production stage
FROM nginx AS production-stage
COPY --from=build-stage /vue_app/dist /usr/share/nginx/html
COPY --from=build-stage /vue_app/proxy/nginx.conf /etc/nginx/conf.d/default.conf
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]