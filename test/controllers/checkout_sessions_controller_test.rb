require "test_helper"

class CheckoutSessionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @checkout_session = checkout_sessions(:one)
  end

  test "should get index" do
    get checkout_sessions_url
    assert_response :success
  end

  test "should get new" do
    get new_checkout_session_url
    assert_response :success
  end

  test "should create checkout_session" do
    assert_difference('CheckoutSession.count') do
      post checkout_sessions_url, params: { checkout_session: { cancel_url: @checkout_session.cancel_url, customer_id: @checkout_session.customer_id, payment_intent: @checkout_session.payment_intent, payment_status: @checkout_session.payment_status, price_id: @checkout_session.price_id, stripe_mode: @checkout_session.stripe_mode, success_url: @checkout_session.success_url } }
    end

    assert_redirected_to checkout_session_url(CheckoutSession.last)
  end

  test "should show checkout_session" do
    get checkout_session_url(@checkout_session)
    assert_response :success
  end

  test "should get edit" do
    get edit_checkout_session_url(@checkout_session)
    assert_response :success
  end

  test "should update checkout_session" do
    patch checkout_session_url(@checkout_session), params: { checkout_session: { cancel_url: @checkout_session.cancel_url, customer_id: @checkout_session.customer_id, payment_intent: @checkout_session.payment_intent, payment_status: @checkout_session.payment_status, price_id: @checkout_session.price_id, stripe_mode: @checkout_session.stripe_mode, success_url: @checkout_session.success_url } }
    assert_redirected_to checkout_session_url(@checkout_session)
  end

  test "should destroy checkout_session" do
    assert_difference('CheckoutSession.count', -1) do
      delete checkout_session_url(@checkout_session)
    end

    assert_redirected_to checkout_sessions_url
  end
end
