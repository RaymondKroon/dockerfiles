FROM ruby:alpine
MAINTAINER Raymond Kroon <raymond@k3n.nl>

RUN apk add --no-cache \
    build-base \
    git && \
    gem install travis && \
    gem install travis-lint && \
    apk del build-base

ENV HOME /home/user

RUN adduser -D -h /home/user user

USER user
WORKDIR /home/user/app

ENTRYPOINT ["travis"]