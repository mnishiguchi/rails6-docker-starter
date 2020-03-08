require 'test_helper'

class UserTest < ActiveSupport::TestCase
  should validate_presence_of(:first_name)
  should validate_presence_of(:last_name)

  test 'valid default factory' do
    assert build(:user).valid?
  end
end
