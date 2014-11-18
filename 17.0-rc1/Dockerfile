FROM ubuntu:14.10
MAINTAINER Federico Carrone <federico.carrone@cgmail.com>

# Important!  Update this no-op ENV variable when this Dockerfile
# is updated with the current date. It will force refresh of all
# of the base images and things like `apt-get update` won't be using
# old cached versions when the Dockerfile is built.
ENV REFRESHED_AT 2014-11-16

RUN apt-get update
RUN apt-get upgrade -y

ENV ERLANG_VERSION 17.0-rc1
ENV REBAR_VERSION 2.5.1
ENV RELX_VERSION 1.1.0-rc2

RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

RUN apt-get install -y \
    libncurses5-dev \
    openssl \
    libssl-dev \
    fop \
    xsltproc \
    unixodbc-dev \
    automake \
    build-essential \
    curl \
    wget \
    git

ADD http://erlang.org/download/otp_src_${ERLANG_VERSION}.tar.gz /usr/src/
RUN cd /usr/src \
    && tar xf otp_src_${ERLANG_VERSION}.tar.gz \
    && cd otp_src_${ERLANG_VERSION} \
    && ./configure \
    && make \
    && make install

ADD https://github.com/rebar/rebar/archive/${REBAR_VERSION}.tar.gz  /usr/src/rebar-${REBAR_VERSION}.tar.gz
RUN cd /usr/src \
    && tar zxf rebar-${REBAR_VERSION}.tar.gz \
    && cd rebar-${REBAR_VERSION} \
    && make \
    && cp rebar /usr/bin/rebar

ADD https://github.com/erlware/relx/archive/${RELX_VERSION}.tar.gz /usr/src/relx-${RELX_VERSION}.tar.gz
RUN cd /usr/src \
    && tar zxf relx-${RELX_VERSION}.tar.gz \
    && cd relx-${RELX_VERSION} \
    && make \
    && cp relx /usr/bin/relx

# Setup home environment
RUN useradd dev
RUN mkdir /home/dev && chown -R dev: /home/dev

WORKDIR /home/dev
ENV HOME /home/dev
USER dev
CMD ["erl"]
