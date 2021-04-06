require "application_system_test_case"

class AuditverificationsTest < ApplicationSystemTestCase
  setup do
    @auditverification = auditverifications(:one)
  end

  test "visiting the index" do
    visit auditverifications_url
    assert_selector "h1", text: "Auditverifications"
  end

  test "creating a Auditverification" do
    visit auditverifications_url
    click_on "New Auditverification"

    fill_in "Big ri", with: @auditverification.big_ri
    fill_in "Big zi", with: @auditverification.big_zi
    fill_in "G1 x", with: @auditverification.g1_x
    fill_in "G1 y", with: @auditverification.g1_y
    fill_in "G2 x", with: @auditverification.g2_x
    fill_in "G2 y", with: @auditverification.g2_y
    fill_in "Ri", with: @auditverification.ri
    fill_in "Vote", with: @auditverification.vote
    click_on "Create Auditverification"

    assert_text "Auditverification was successfully created"
    click_on "Back"
  end

  test "updating a Auditverification" do
    visit auditverifications_url
    click_on "Edit", match: :first

    fill_in "Big ri", with: @auditverification.big_ri
    fill_in "Big zi", with: @auditverification.big_zi
    fill_in "G1 x", with: @auditverification.g1_x
    fill_in "G1 y", with: @auditverification.g1_y
    fill_in "G2 x", with: @auditverification.g2_x
    fill_in "G2 y", with: @auditverification.g2_y
    fill_in "Ri", with: @auditverification.ri
    fill_in "Vote", with: @auditverification.vote
    click_on "Update Auditverification"

    assert_text "Auditverification was successfully updated"
    click_on "Back"
  end

  test "destroying a Auditverification" do
    visit auditverifications_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Auditverification was successfully destroyed"
  end
end
