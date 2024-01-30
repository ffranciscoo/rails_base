ARG RUBY_VERSION=3.2.2
ARG BUILD_ENV

FROM ruby:$RUBY_VERSION AS base

RUN gem install bundler

COPY . /rails_base

WORKDIR /rails_base

RUN apt update && \
    apt install -y postgresql-client

RUN bundle install

# Required to run bin/rails edit:credentials
ENV EDITOR=vim

ENTRYPOINT ["bundle", "exec", "rails", "server", "-b", "0.0.0.0", "-p", "3000"]

FROM base AS development

FROM base AS production

FROM ${BUILD_ENV} AS final