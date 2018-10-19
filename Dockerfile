FROM alpine

RUN apk --update add \
  bash \
  curl \
  nodejs \
  npm \
  openjdk8 \
  tmux \
  tzdata \
  vim \
  wget

RUN npm i -g npm
RUN npm install http-server -g

# ngrok
ADD https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip /root/
RUN unzip -d /root/ /root/ngrok-stable-linux-amd64.zip
RUN rm /root/ngrok-stable-linux-amd64.zip

# atlassian SDK
ADD https://marketplace.atlassian.com/download/plugins/atlassian-plugin-sdk-tgz?_ga=2.91726810.1568252076.1539768337-1062406713.1537195243 /root/atlassian-plugin-sdk-6.3.10.tar.gz
RUN mkdir /opt
RUN tar -xvzf /root/atlassian-plugin-sdk-6.3.10.tar.gz -C /opt
RUN mv /opt/atlassian-plugin-sdk-6.3.10 /opt/atlassian-plugin-sdk
ENV PATH="/opt/atlassian-plugin-sdk/bin:${PATH}"

WORKDIR /app
