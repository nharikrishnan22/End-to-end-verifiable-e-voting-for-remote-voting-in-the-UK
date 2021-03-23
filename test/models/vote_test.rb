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

  # Need to modify this so this works
  # test "user should not be able to vote twice" do
  #   u = User.new
  #   u.email = "john@example.com"
  #   u.dateofbirth =  2020-11-23
  #   u.firstname = "MyString"
  #   u.lastname = "MyString"
  #   u.password_digest = BCrypt::Password.create('secret')
  #   u.avatar = ""
  #   vote = Vote.new
  #   vote.id = 1
  #   vote.big_ri =  1
  #   vote.big_zi =  1
  #   vote.pwf = false
  #   vote.status = "confirmed"
  #   vote.user =  u
  #   vote2  = vote
  #   assert vote.save, "Could not save vote" # error message is on this line
  #   assert_not vote2.save, "Saved a duplicate vote" # error message is on this line
  # end
end
