FROM ubuntu:14.10
MAINTAINER Federico Carrone <federico.carrone@cgmail.com>

ENV ERLANG_VERSION 17.0
ENV KERL_CONFIGURE_OPTIONS --with-ssl

RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

RUN apt-get update
RUN apt-get upgrade -y

RUN apt-get install -y \
    libncurses5-dev \
    openssl \
    libssl-dev \
    automake \
    build-essential \
    curl \
    wget \
    git

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
