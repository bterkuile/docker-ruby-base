FROM ubuntu:14.10

MAINTAINER Benjamin ter Kuile <bterkuile@gmail.com>

RUN apt-get update
#RUN apt-get upgrade -y

RUN apt-get install -y build-essential zlib1g-dev libssl-dev libreadline6-dev libyaml-dev git-core

ADD http://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.0.tar.gz /tmp/

RUN cd /tmp && tar -xzf ruby-2.2.0.tar.gz && cd ruby-2.2.0 && ./configure --disable-install-rdoc && make && make install && cd .. && rm -rf ruby-2.2.0 && rm -f ruby-2.2.0.tar.gz

RUN yes | gem update -f -N
RUN gem install -N bundler
