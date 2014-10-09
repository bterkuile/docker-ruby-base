FROM ubuntu:14.04.1

MAINTAINER Benjamin ter Kuile <bterkuile@gmail.com>

RUN apt-get update
#RUN apt-get upgrade -y

RUN apt-get install -y build-essential zlib1g-dev libssl-dev libreadline6-dev libyaml-dev git-core

ADD http://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.3.tar.gz /tmp/

RUN cd /tmp && tar -xzf ruby-2.1.3.tar.gz && cd ruby-2.1.3 && ./configure --disable-install-rdoc && make && make install && cd .. && rm -rf ruby-2.1.3 && rm -f ruby-2.1.3.tar.gz

RUN yes | gem update -f -N
RUN gem install -N bundler
