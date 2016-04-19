# fakes3
#
# VERSION               0.0.1

FROM      gendosu/ubuntu-ruby:2.2.3

MAINTAINER Gen Takahashi "gendosu@gmail.com"

ENV FAKE_PORT=8081
ENV FAKE_DIR=/tmp/fakes3

WORKDIR /root
COPY Gemfile      /root/Gemfile
COPY Gemfile.lock /root/Gemfile.lock

ENV PATH /usr/local/rbenv/bin:/usr/local/rbenv/shims:$PATH

RUN eval "$(rbenv init -)"; bundle \
&&  mkdir -p $FAKE_DIR

EXPOSE $FAKE_PORT

CMD eval "$(rbenv init -)"; /usr/local/rbenv/shims/fakes3 server --root=$FAKE_DIR --port=$FAKE_PORT

