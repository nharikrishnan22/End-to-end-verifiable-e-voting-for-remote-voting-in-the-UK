require 'test_helper'

class AuditverificationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @auditverification = auditverifications(:one)
  end

  test "should get index" do
    get auditverifications_url
    assert_response :success
  end

  test "should get new" do
    get new_auditverification_url
    assert_response :success
  end

  test "should create auditverification" do
    assert_difference('Auditverification.count') do
      post auditverifications_url, params: { auditverification: { big_ri: @auditverification.big_ri, big_zi: @auditverification.big_zi, g1_x: @auditverification.g1_x, g1_y: @auditverification.g1_y, g2_x: @auditverification.g2_x, g2_y: @auditverification.g2_y, ri: @auditverification.ri, vote: @auditverification.vote } }
    end

    assert_redirected_to auditverification_url(Auditverification.last)
  end

  test "should show auditverification" do
    get auditverification_url(@auditverification)
    assert_response :success
  end

  test "should get edit" do
    get edit_auditverification_url(@auditverification)
    assert_response :success
  end

  test "should update auditverification" do
    patch auditverification_url(@auditverification), params: { auditverification: { big_ri: @auditverification.big_ri, big_zi: @auditverification.big_zi, g1_x: @auditverification.g1_x, g1_y: @auditverification.g1_y, g2_x: @auditverification.g2_x, g2_y: @auditverification.g2_y, ri: @auditverification.ri, vote: @auditverification.vote } }
    assert_redirected_to auditverification_url(@auditverification)
  end

  test "should destroy auditverification" do
    assert_difference('Auditverification.count', -1) do
      delete auditverification_url(@auditverification)
    end

    assert_redirected_to auditverifications_url
  end
end
