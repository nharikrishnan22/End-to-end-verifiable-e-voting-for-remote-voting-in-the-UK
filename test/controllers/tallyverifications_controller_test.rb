require 'test_helper'

class TallyverificationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tallyverification = tallyverifications(:one)
  end

  test "should get index" do
    get tallyverifications_url
    assert_response :success
  end

  test "should get new" do
    get new_tallyverification_url
    assert_response :success
  end

  test "should create tallyverification" do
    assert_difference('Tallyverification.count') do
      post tallyverifications_url, params: { tallyverification: { g1_x: @tallyverification.g1_x, g1_y: @tallyverification.g1_y, g2_x: @tallyverification.g2_x, g2_y: @tallyverification.g2_y, s: @tallyverification.s, t: @tallyverification.t } }
    end

    assert_redirected_to tallyverification_url(Tallyverification.last)
  end

  test "should show tallyverification" do
    get tallyverification_url(@tallyverification)
    assert_response :success
  end

  test "should get edit" do
    get edit_tallyverification_url(@tallyverification)
    assert_response :success
  end

  test "should update tallyverification" do
    patch tallyverification_url(@tallyverification), params: { tallyverification: { g1_x: @tallyverification.g1_x, g1_y: @tallyverification.g1_y, g2_x: @tallyverification.g2_x, g2_y: @tallyverification.g2_y, s: @tallyverification.s, t: @tallyverification.t } }
    assert_redirected_to tallyverification_url(@tallyverification)
  end

  test "should destroy tallyverification" do
    assert_difference('Tallyverification.count', -1) do
      delete tallyverification_url(@tallyverification)
    end

    assert_redirected_to tallyverifications_url
  end
end
