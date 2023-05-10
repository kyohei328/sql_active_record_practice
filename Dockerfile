FROM ruby:3.1.4
ENV LANG C.UTF-8
ENV TZ Asia/Tokyo
RUN curl -sL https://deb.nodesource.com/setup_18.x | bash - \
  && wget --quiet -O - /tmp/pubkey.gpg https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
  && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
  && apt-get update -qq \
  && apt-get install -y build-essential libpq-dev nodejs yarn mariadb-client
RUN mkdir /sql_active_record_practice
WORKDIR /sql_active_record_practice
RUN gem install bundler:2.3.17
COPY config/database-docker.yml /sql_active_record_practice/config/database.yml
COPY Gemfile /sql_active_record_practice/Gemfile
COPY Gemfile.lock /sql_active_record_practice/Gemfile.lock
RUN bundle install
COPY . /sql_active_record_practice
