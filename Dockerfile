FROM ruby:2.2.3
RUN apt-get update -qq && apt-get install -y build-essential

ARG RACK_ENV=production
ENV RACK_ENV=${RACK_ENV}

ARG ALLOWED_ORIGINS=http://localhost:3000
ENV ALLOWED_ORIGINS=${RACK_ENV}

ENV APP_HOME /app

RUN mkdir $APP_HOME
WORKDIR $APP_HOME

ADD Gemfile* $APP_HOME/
RUN bundle install

EXPOSE 9292

ADD . $APP_HOME

CMD ["bundle exec", "rackup"]