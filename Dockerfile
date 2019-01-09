# -*- coding: utf-8 -*-
ARG RUBY_VERSION=2.6

FROM ruby:${RUBY_VERSION}.0-alpine
MAINTAINER Takahiro INOUE <takahiro.inoue@aist.go.jp>

WORKDIR /work

ADD . .

RUN apk update && \
    apk add       \
      git

RUN bundle install -j $(cat /proc/cpuinfo | grep '^processor' | wc -l)

ENTRYPOINT [ "rake", "spec" ]
