require "application_system_test_case"

class YachtsTest < ApplicationSystemTestCase
  setup do
    @yacht = yachts(:one)
  end

  test "visiting the index" do
    visit yachts_url
    assert_selector "h1", text: "Yachts"
  end

  test "creating a Yacht" do
    visit yachts_url
    click_on "New Yacht"

    fill_in "Length", with: @yacht.length
    fill_in "Name", with: @yacht.name
    fill_in "Registration number", with: @yacht.registration_number
    check "Sail" if @yacht.sail
    click_on "Create Yacht"

    assert_text "Yacht was successfully created"
    click_on "Back"
  end

  test "updating a Yacht" do
    visit yachts_url
    click_on "Edit", match: :first

    fill_in "Length", with: @yacht.length
    fill_in "Name", with: @yacht.name
    fill_in "Registration number", with: @yacht.registration_number
    check "Sail" if @yacht.sail
    click_on "Update Yacht"

    assert_text "Yacht was successfully updated"
    click_on "Back"
  end

  test "destroying a Yacht" do
    visit yachts_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Yacht was successfully destroyed"
  end
end
