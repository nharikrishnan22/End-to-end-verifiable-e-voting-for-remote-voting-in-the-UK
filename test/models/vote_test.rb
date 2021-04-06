require 'test_helper'

class VoteTest < ActiveSupport::TestCase
  test "should not save vote without details" do
    vote = Vote.new
    assert_not vote.save, "Saved a vote without any details" # error message is on this line
  end

  test "Save vote fixture 1" do
    vote = votes(:one)
    assert vote.save, "Not able to save vote"
  end

  test "Save vote fixture 2" do
    vote = votes(:two)
    assert_not vote.save, "Vote should not be saved without voting for a candidate"
  end
end
