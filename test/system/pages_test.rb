# frozen_string_literal: true

require 'application_system_test_case'

class PagesTest < ApplicationSystemTestCase
  test 'page header text is enhanced by javascript' do
    visit root_url
    assert_selector 'h1', text: 'Home Page ENHANCED!'
  end

  test 'page view count' do
    Redis.new.flushdb
    visit root_url
    assert_text 'This page has been viewed 1 time!'
    visit root_url
    assert_text 'This page has been viewed 2 times!'
  end

  test 'HelloWorld component rendering message' do
    visit root_url
    assert_text 'Hello from react-rails'
  end
end
