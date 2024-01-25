FROM ruby:3.2.2

RUN gem install bundler

COPY . /rails_base

WORKDIR /rails_base

RUN apt update && \
    apt install -y postgresql-client

RUN bundle install

ENTRYPOINT ["bundle", "exec", "rails", "server", "-b", "0.0.0.0", "-p", "3000"]