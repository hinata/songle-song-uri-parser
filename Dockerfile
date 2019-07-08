#@# vim: set filetype=ruby:
ARG RUBY_VERSION=2.6.0

FROM ruby:${RUBY_VERSION}-alpine
MAINTAINER Takahiro INOUE <takahiro.inoue@aist.go.jp>

WORKDIR /work

ADD . .

RUN apk update && \
    apk add       \
      git

RUN bundle install -j $(cat /proc/cpuinfo | grep '^processor' | wc -l)

ENTRYPOINT [ "rake", "spec" ]
