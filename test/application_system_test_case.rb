# frozen_string_literal: true

require 'test_helper'

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  driven_by :selenium_chrome_in_container

  def setup
    # https://www.rubydoc.info/github/jnicklas/capybara/Capybara.configure
    Capybara.server_host = ENV['CAPYBARA_SERVER_HOST']
    Capybara.server_port = ENV['CAPYBARA_SERVER_PORT']
    # The default host to use when giving a relative URL to visit.
    # This is necessary because by default Capybara visits a page
    # using http://127.0.0.1 instead of our container's IP address.
    Capybara.app_host = ENV['CAPYBARA_APP_HOST']

    super
  end
end
