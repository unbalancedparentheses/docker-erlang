#!/usr/bin/env fish

function otp_versions
        curl -sSL --compressed "http://www.erlang.org/download/MD5" \
        | grep ".*otp_src.*\.tar\.gz" \
        | grep -v "otp_src_doc" \
        | sed 's/.*(otp_src_\(.*\)\.tar\.gz).*/\1/'
end

set versions (otp_versions)

for version in $versions
        mkdir -p $version
        sed "s/^ENV ERLANG_VERSION \(.*\)/ENV ERLANG_VERSION $version/g" base/Dockerfile > $version/Dockerfile
        cp base/install.sh $version/install.sh
end
