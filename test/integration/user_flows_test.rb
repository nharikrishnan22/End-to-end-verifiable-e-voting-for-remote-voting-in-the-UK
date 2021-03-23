require 'test_helper'

class UserFlowsTest < ActionDispatch::IntegrationTest
  test "can see the welcome title" do
    get "/"
    assert_select "h1", "E-Voting using DRE-ip"
  end

  test "can see login title when signing in" do
    get "/login"
    assert_select "h1", "Login"
  end

  test "200 Code when vising homepage" do
    get "/"
    assert_response :success
  end
  
end

