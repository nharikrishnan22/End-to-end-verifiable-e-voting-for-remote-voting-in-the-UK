require 'test_helper'

class WellformednessverificationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @wellformednessverification = wellformednessverifications(:one)
  end

  test "should get index" do
    get wellformednessverifications_url
    assert_response :success
  end

  test "should get new" do
    get new_wellformednessverification_url
    assert_response :success
  end

  test "should create wellformednessverification" do
    assert_difference('Wellformednessverification.count') do
      post wellformednessverifications_url, params: { wellformednessverification: { c_1: @wellformednessverification.c_1, c_2: @wellformednessverification.c_2, r_1: @wellformednessverification.r_1, r_2: @wellformednessverification.r_2 } }
    end

    assert_redirected_to wellformednessverification_url(Wellformednessverification.last)
  end

  test "should show wellformednessverification" do
    get wellformednessverification_url(@wellformednessverification)
    assert_response :success
  end

  test "should get edit" do
    get edit_wellformednessverification_url(@wellformednessverification)
    assert_response :success
  end

  test "should update wellformednessverification" do
    patch wellformednessverification_url(@wellformednessverification), params: { wellformednessverification: { c_1: @wellformednessverification.c_1, c_2: @wellformednessverification.c_2, r_1: @wellformednessverification.r_1, r_2: @wellformednessverification.r_2 } }
    assert_redirected_to wellformednessverification_url(@wellformednessverification)
  end

  test "should destroy wellformednessverification" do
    assert_difference('Wellformednessverification.count', -1) do
      delete wellformednessverification_url(@wellformednessverification)
    end

    assert_redirected_to wellformednessverifications_url
  end
end
