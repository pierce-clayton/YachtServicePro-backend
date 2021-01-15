require "application_system_test_case"

class CustomerYachtsTest < ApplicationSystemTestCase
  setup do
    @customer_yacht = customer_yachts(:one)
  end

  test "visiting the index" do
    visit customer_yachts_url
    assert_selector "h1", text: "Customer Yachts"
  end

  test "creating a Customer yacht" do
    visit customer_yachts_url
    click_on "New Customer Yacht"

    fill_in "Customer", with: @customer_yacht.customer_id
    fill_in "Yacht", with: @customer_yacht.yacht_id
    click_on "Create Customer yacht"

    assert_text "Customer yacht was successfully created"
    click_on "Back"
  end

  test "updating a Customer yacht" do
    visit customer_yachts_url
    click_on "Edit", match: :first

    fill_in "Customer", with: @customer_yacht.customer_id
    fill_in "Yacht", with: @customer_yacht.yacht_id
    click_on "Update Customer yacht"

    assert_text "Customer yacht was successfully updated"
    click_on "Back"
  end

  test "destroying a Customer yacht" do
    visit customer_yachts_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Customer yacht was successfully destroyed"
  end
end
