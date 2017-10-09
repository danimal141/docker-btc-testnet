FROM ubuntu:16.04

MAINTAINER Hideaki Ishii <hideaki.ishii1204@gmail.com>

RUN apt-get update
RUN apt-get install -y software-properties-common
RUN add-apt-repository ppa:bitcoin/bitcoin

RUN apt-get update && apt-get install -y bitcoind

RUN adduser --disabled-login --gecos "" testuser

WORKDIR /home/testuser

RUN mkdir -p ./.bitcoin
ADD bitcoin.conf ./.bitcoin/bitcoin.conf
RUN chown -R testuser:testuser ./.bitcoin/

VOLUME ["/.bitcoin"]

USER testuser

EXPOSE 18332 18333

ENTRYPOINT ["/bin/bash"]
