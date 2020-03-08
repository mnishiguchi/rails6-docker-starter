FROM ruby:2.6

LABEL maintainer="mnishiguchi"

# https://github.com/rails/webpacker/blob/master/docs/docker.md
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash \
 && apt-get update && apt-get install -y nodejs && rm -rf /var/lib/apt/lists/* \
 && curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
 && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
 && apt-get update && apt-get install -y yarn && rm -rf /var/lib/apt/lists/*

# Specify app home directory
ENV APP_HOME /railsapp
RUN mkdir $APP_HOME
WORKDIR $APP_HOME

# Install and cache ruby gems
ENV BUNDLE_PATH /ruby_gems
RUN gem install bundler -v 2.1.2
ADD Gemfile $APP_HOME/Gemfile
ADD Gemfile.lock $APP_HOME/Gemfile.lock
RUN bundle install

# Install and cache node dependencies
ADD package.json $APP_HOME/package.json
ADD yarn.lock $APP_HOME/yarn.lock
RUN yarn install --check-files --modules-folder /node_modules

# Copy app files
ADD . $APP_HOME

ENTRYPOINT ["./docker-entrypoint.sh"]
CMD ["bin/rails", "s", "-b", "0.0.0.0"]
