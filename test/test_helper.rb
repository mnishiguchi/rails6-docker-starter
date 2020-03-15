# frozen_string_literal: true

ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

# https://github.com/freerange/mocha#rails
require 'mocha/minitest'

class ActiveSupport::TestCase
  # TODO: Find out how to use this with system tests.
  # Currently I keep on getting this error when I run system tests:
  #   Address already in use - bind(2) for "0.0.0.0" port 4000 (Errno::EADDRINUSE)
  #
  # Run tests in parallel with specified workers
  # parallelize(workers: :number_of_processors)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...

  # https://github.com/thoughtbot/factory_bot/blob/master/GETTING_STARTED.md
  include FactoryBot::Syntax::Methods

  # https://github.com/rails/rails/pull/28341
  Capybara.register_driver :selenium_chrome_in_container do |app|
    Capybara::Selenium::Driver.new(
      app,
      browser: :remote,
      # By default, Selenium listens for incoming client requests at http://<host>:4444/wd/hub.
      url: ENV.fetch('SELENIUM_REMOTE_URL'),
      desired_capabilities: :chrome
    )
  end
end
