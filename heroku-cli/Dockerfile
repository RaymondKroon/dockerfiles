FROM ubuntu:14.04
MAINTAINER Raymond Kroon <raymond@k3n.nl>

ENV HEROKU_VERSION 3.43.2

RUN apt-get update && apt-get install -y \
	wget \
    && wget -O- https://toolbelt.heroku.com/install-ubuntu.sh | sh \
	&& rm -rf /var/lib/apt/lists/*

ENV HOME /home/user

RUN useradd --create-home --home-dir $HOME user \
	&& chown -R user:user $HOME

USER user
ENV PATH=/usr/local/heroku/bin:$PATH

RUN heroku --version
WORKDIR /home/user/app

ENTRYPOINT ["heroku"]