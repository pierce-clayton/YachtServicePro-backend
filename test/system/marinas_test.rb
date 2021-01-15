require "application_system_test_case"

class MarinasTest < ApplicationSystemTestCase
  setup do
    @marina = marinas(:one)
  end

  test "visiting the index" do
    visit marinas_url
    assert_selector "h1", text: "Marinas"
  end

  test "creating a Marina" do
    visit marinas_url
    click_on "New Marina"

    fill_in "Address line 1", with: @marina.address_line_1
    fill_in "Address line 2", with: @marina.address_line_2
    fill_in "City", with: @marina.city
    fill_in "Description", with: @marina.description
    fill_in "State", with: @marina.state
    fill_in "Zip", with: @marina.zip
    click_on "Create Marina"

    assert_text "Marina was successfully created"
    click_on "Back"
  end

  test "updating a Marina" do
    visit marinas_url
    click_on "Edit", match: :first

    fill_in "Address line 1", with: @marina.address_line_1
    fill_in "Address line 2", with: @marina.address_line_2
    fill_in "City", with: @marina.city
    fill_in "Description", with: @marina.description
    fill_in "State", with: @marina.state
    fill_in "Zip", with: @marina.zip
    click_on "Update Marina"

    assert_text "Marina was successfully updated"
    click_on "Back"
  end

  test "destroying a Marina" do
    visit marinas_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Marina was successfully destroyed"
  end
end
