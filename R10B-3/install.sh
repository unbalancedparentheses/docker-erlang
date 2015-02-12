#!/usr/bin/env bash

apt-get install -y \
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

mkdir -p /usr/src/erlang
wget http://erlang.org/download/otp_src_${ERLANG_VERSION}.tar.gz -P /usr/src/erlang
cd /usr/src/erlang \
    && tar zxf otp_src_${ERLANG_VERSION}.tar.gz \
    && cd otp_src_${ERLANG_VERSION} \
    && ./configure \
    && make \
    && make install

mkdir -p /usr/src/rebar
wget https://github.com/rebar/rebar/archive/${REBAR_VERSION}.tar.gz -P /usr/src/rebar
cd /usr/src/rebar \
    && tar zxf ${REBAR_VERSION}.tar.gz \
    && cd rebar-${REBAR_VERSION} \
    && make \
    && cp rebar /usr/bin/rebar

mkdir -p /usr/src/relx
wget https://github.com/erlware/relx/archive/v${RELX_VERSION}.tar.gz -P /usr/src/relx
cd /usr/src/relx \
    && tar zxf v${RELX_VERSION}.tar.gz \
    && cd relx-${RELX_VERSION} \
    && make \
    && cp relx /usr/bin/relx

# Cleanup
apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/src/*
