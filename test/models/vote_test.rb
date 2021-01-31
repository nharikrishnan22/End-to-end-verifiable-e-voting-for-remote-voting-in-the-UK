require 'test_helper'

class VoteTest < ActiveSupport::TestCase
  test "should not save vote without details" do
    vote = Vote.new
    assert_not vote.save, "Saved a vote without any details" # error message is on this line
  end
end
