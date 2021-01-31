require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "should not save user without details" do
    user = User.new
    assert_not user.save, "Saved a user without any details" # error message is on this line
  end
end
