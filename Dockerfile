FROM ruby:2.7.1-alpine

RUN apk add --update --no-cache \
    alpine-sdk \
    imagemagick \
    nodejs \
    postgresql-client \
    postgresql-dev \
    tzdata \
    yarn

WORKDIR /app

COPY Gemfile Gemfile.lock ./

RUN bundle check || bundle install

COPY package.json yarn.lock ./

RUN yarn install --check-files

COPY . ./

ENTRYPOINT ["./entrypoints/docker-entrypoint.sh"]
