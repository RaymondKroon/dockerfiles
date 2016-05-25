FROM ubuntu:14.04
MAINTAINER Raymond Kroon <raymond@k3n.nl>

RUN apt-get update && apt-get install -y \
	software-properties-common \
	--no-install-recommends && \
	add-apt-repository ppa:ubuntugis/ppa && \
	apt-get update && \
	apt-get install -y \
	qgis \
	&& rm -rf /var/lib/apt/lists/*

ENV HOME /home/user

RUN useradd --create-home --home-dir $HOME user \
	&& chown -R user:user $HOME

WORKDIR $HOME/app
USER user

ENTRYPOINT [ "qgis" ]
