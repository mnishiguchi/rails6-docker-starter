# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.5'

gem 'rails', '~> 6.0.2', '>= 6.0.2.1'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 4.1'
gem 'webpacker', '~> 4.0' # https://github.com/rails/webpacker
gem 'turbolinks', '~> 5' # https://github.com/turbolinks/turbolinks
gem 'jbuilder', '~> 2.7' # https://github.com/rails/jbuilder
gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.2', require: false
gem 'awesome_print'

group :development, :test do
  gem 'factory_bot_rails'
  gem 'faker', '~> 2.10', '>= 2.10.2'
  gem 'pry'
  gem 'pry-byebug'
  gem 'pry-rails'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring' # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0' # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
end

group :test do
  gem 'capybara', '~> 3.7' # Adds support for Capybara system testing and selenium driver
  gem 'rails-controller-testing'
  gem 'selenium-webdriver', '~> 3.14'
  gem 'shoulda', '~> 3.5'
  gem 'shoulda-matchers', '~> 2.0' # https://github.com/thoughtbot/shoulda-matchers#minitest
end
