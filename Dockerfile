FROM alpine

RUN apk --update add \
  bash \
  curl \
  nodejs \
  npm \
  tmux \
  tzdata \
  vim \
  wget

RUN npm i -g npm

WORKDIR /app
