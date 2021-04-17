require "application_system_test_case"

class WellformednessverificationsTest < ApplicationSystemTestCase
  setup do
    @wellformednessverification = wellformednessverifications(:one)
  end

  test "visiting the index" do
    visit wellformednessverifications_url
    assert_selector "h1", text: "Wellformednessverifications"
  end

  test "creating a Wellformednessverification" do
    visit wellformednessverifications_url
    click_on "New Wellformednessverification"

    fill_in "C 1", with: @wellformednessverification.c_1
    fill_in "C 2", with: @wellformednessverification.c_2
    fill_in "R 1", with: @wellformednessverification.r_1
    fill_in "R 2", with: @wellformednessverification.r_2
    click_on "Create Wellformednessverification"

    assert_text "Wellformednessverification was successfully created"
    click_on "Back"
  end

  test "updating a Wellformednessverification" do
    visit wellformednessverifications_url
    click_on "Edit", match: :first

    fill_in "C 1", with: @wellformednessverification.c_1
    fill_in "C 2", with: @wellformednessverification.c_2
    fill_in "R 1", with: @wellformednessverification.r_1
    fill_in "R 2", with: @wellformednessverification.r_2
    click_on "Update Wellformednessverification"

    assert_text "Wellformednessverification was successfully updated"
    click_on "Back"
  end

  test "destroying a Wellformednessverification" do
    visit wellformednessverifications_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Wellformednessverification was successfully destroyed"
  end
end
