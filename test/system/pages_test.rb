# frozen_string_literal: true

require 'application_system_test_case'

class PagesTest < ApplicationSystemTestCase
  driven_by :rack_test

  test 'Page header text is correct' do
    visit root_url
    assert_selector 'h1', text: 'Home Page'
  end
end
