require "application_system_test_case"

class CheckoutSessionsTest < ApplicationSystemTestCase
  setup do
    @checkout_session = checkout_sessions(:one)
  end

  test "visiting the index" do
    visit checkout_sessions_url
    assert_selector "h1", text: "Checkout Sessions"
  end

  test "creating a Checkout session" do
    visit checkout_sessions_url
    click_on "New Checkout Session"

    fill_in "Cancel url", with: @checkout_session.cancel_url
    fill_in "Customer", with: @checkout_session.customer_id
    fill_in "Payment intent", with: @checkout_session.payment_intent
    fill_in "Payment status", with: @checkout_session.payment_status
    fill_in "Price", with: @checkout_session.price_id
    fill_in "Stripe mode", with: @checkout_session.stripe_mode
    fill_in "Success url", with: @checkout_session.success_url
    click_on "Create Checkout session"

    assert_text "Checkout session was successfully created"
    click_on "Back"
  end

  test "updating a Checkout session" do
    visit checkout_sessions_url
    click_on "Edit", match: :first

    fill_in "Cancel url", with: @checkout_session.cancel_url
    fill_in "Customer", with: @checkout_session.customer_id
    fill_in "Payment intent", with: @checkout_session.payment_intent
    fill_in "Payment status", with: @checkout_session.payment_status
    fill_in "Price", with: @checkout_session.price_id
    fill_in "Stripe mode", with: @checkout_session.stripe_mode
    fill_in "Success url", with: @checkout_session.success_url
    click_on "Update Checkout session"

    assert_text "Checkout session was successfully updated"
    click_on "Back"
  end

  test "destroying a Checkout session" do
    visit checkout_sessions_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Checkout session was successfully destroyed"
  end
end
