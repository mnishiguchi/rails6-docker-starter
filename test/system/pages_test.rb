# frozen_string_literal: true

require 'application_system_test_case'

class PagesTest < ApplicationSystemTestCase
  driven_by :rack_test

  test 'HelloWorld component rendering message' do
    visit root_url
    assert_text 'Hello from react-rails'
  end
end
