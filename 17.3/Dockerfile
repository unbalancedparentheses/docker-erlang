FROM ubuntu:14.10
MAINTAINER Federico Carrone <federico.carrone@cgmail.com>

ENV ERLANG_VERSION 17.3
ENV KERL_CONFIGURE_OPTIONS --with-ssl

RUN apt-get update && apt-get install -y \
    aufs-tools \
    libncurses5-dev \
    libssl-dev \
    automake \
    build-essential \
    curl \
    git \
    wget

# Setup home environment
RUN useradd dev
RUN mkdir /home/dev && chown -R dev: /home/dev

WORKDIR /home/dev
ENV HOME /home/dev

# Install erlang
RUN mkdir /home/dev/erlang
WORKDIR /home/dev/erlang
RUN curl -O https://raw.githubusercontent.com/spawngrid/kerl/master/kerl
RUN chmod a+x kerl
RUN ./kerl build ${ERLANG_VERSION} ${ERLANG_VERSION}
RUN ./kerl install ${ERLANG_VERSION} ${ERLANG_VERSION}
RUN echo ". /home/dev/erlang/${ERLANG_VERSION}/activate" >> ~/.bashrc

RUN chown -R dev: /home/dev

WORKDIR /home/dev
USER dev
