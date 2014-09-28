FROM ruby:2.1

RUN mkdir -p /usr/local/src/janitor

ADD . /usr/local/src/janitor

WORKDIR /usr/local/src/janitor

RUN gem install bundler puma --no-ri --no-rdoc

RUN bundle install

CMD puma -C /usr/local/src/janitor/config.ru -p 80
