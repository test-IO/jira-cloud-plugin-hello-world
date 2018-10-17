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

# ngrok
ADD https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip /root/
RUN unzip -d /root/ /root/ngrok-stable-linux-amd64.zip
RUN rm /root/ngrok-stable-linux-amd64.zip

WORKDIR /app
