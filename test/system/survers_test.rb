require "application_system_test_case"

class SurversTest < ApplicationSystemTestCase
  setup do
    @surver = survers(:one)
  end

  test "visiting the index" do
    visit survers_url
    assert_selector "h1", text: "Survers"
  end

  test "creating a Surver" do
    visit survers_url
    click_on "New Surver"

    fill_in "Name", with: @surver.name
    click_on "Create Surver"

    assert_text "Surver was successfully created"
    click_on "Back"
  end

  test "updating a Surver" do
    visit survers_url
    click_on "Edit", match: :first

    fill_in "Name", with: @surver.name
    click_on "Update Surver"

    assert_text "Surver was successfully updated"
    click_on "Back"
  end

  test "destroying a Surver" do
    visit survers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Surver was successfully destroyed"
  end
end
