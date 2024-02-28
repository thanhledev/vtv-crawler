FROM alpine:3.13
RUN apk add -U --no-cache npm git

WORKDIR /frontend

COPY package.json /vue3/package.json

RUN npm install

COPY . /frontend/

RUN npm run build

EXPOSE 8080

ENTRYPOINT ["npx", "vite", "--host", "0.0.0.0", "--port", "8080", "--mode", "staging"]