FROM node:latest

# Install Ruby
RUN \
  apt-get update && \
  apt-get install -y ruby ruby-dev && \
  rm -rf /var/lib/apt/lists/*

WORKDIR /home/app
ADD . /home/app

RUN \
    make install && \
    npm rebuild node-sass && \
    make build

EXPOSE 3001

CMD ["gulp", "serve-dist"]
