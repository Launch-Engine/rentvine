FROM ruby:3.3.5

RUN apt update -yqq
# RUN apt-get install libvips-dev -yqq
# RUN apt-get install build-essential libpq-dev postgresql-contrib vim -yqq
# RUN apt-get install imagemagick libmagickcore-dev libmagickwand-dev -yqq
RUN apt-get -q clean
RUN rm -rf /var/lib/apt/lists/* /usr/share/doc /usr/share/man

RUN mkdir -p /app
WORKDIR /app

RUN gem update --system
RUN gem install bundler --version 2.4.6
RUN bundle config set specific_platform x86_64-linux
COPY . .
RUN bundle install


# RUN bundle binstubs --all

# RUN chmod +x docker-entrypoint.sh
# ENTRYPOINT ["/app/docker-entrypoint.sh"]
# CMD ["sleep", "100000"]
