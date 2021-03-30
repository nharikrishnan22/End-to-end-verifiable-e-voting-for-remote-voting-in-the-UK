require "application_system_test_case"

class TallyverificationsTest < ApplicationSystemTestCase
  setup do
    @tallyverification = tallyverifications(:one)
  end

  test "visiting the index" do
    visit tallyverifications_url
    assert_selector "h1", text: "Tallyverifications"
  end

  test "creating a Tallyverification" do
    visit tallyverifications_url
    click_on "New Tallyverification"

    fill_in "G1 x", with: @tallyverification.g1_x
    fill_in "G1 y", with: @tallyverification.g1_y
    fill_in "G2 x", with: @tallyverification.g2_x
    fill_in "G2 y", with: @tallyverification.g2_y
    fill_in "S", with: @tallyverification.s
    fill_in "T", with: @tallyverification.t
    click_on "Create Tallyverification"

    assert_text "Tallyverification was successfully created"
    click_on "Back"
  end

  test "updating a Tallyverification" do
    visit tallyverifications_url
    click_on "Edit", match: :first

    fill_in "G1 x", with: @tallyverification.g1_x
    fill_in "G1 y", with: @tallyverification.g1_y
    fill_in "G2 x", with: @tallyverification.g2_x
    fill_in "G2 y", with: @tallyverification.g2_y
    fill_in "S", with: @tallyverification.s
    fill_in "T", with: @tallyverification.t
    click_on "Update Tallyverification"

    assert_text "Tallyverification was successfully updated"
    click_on "Back"
  end

  test "destroying a Tallyverification" do
    visit tallyverifications_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Tallyverification was successfully destroyed"
  end
end
