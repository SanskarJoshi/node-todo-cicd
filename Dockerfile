FROM node:12.2.0-alpine
WORKDIR app
COPY . .
RUN curl -fsSLO https://get.docker.com/builds/Linux/x86_64/docker-17.04.0-ce.tgz \
  && tar xzvf docker-17.04.0-ce.tgz \
  && mv docker/docker /usr/local/bin \
  && rm -r docker docker-17.04.0-ce.tgz
RUN npm install
RUN npm run test
EXPOSE 8000
CMD ["node","app.js"]
