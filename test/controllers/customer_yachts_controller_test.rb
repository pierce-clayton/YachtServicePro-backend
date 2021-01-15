require "test_helper"

class CustomerYachtsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @customer_yacht = customer_yachts(:one)
  end

  test "should get index" do
    get customer_yachts_url
    assert_response :success
  end

  test "should get new" do
    get new_customer_yacht_url
    assert_response :success
  end

  test "should create customer_yacht" do
    assert_difference('CustomerYacht.count') do
      post customer_yachts_url, params: { customer_yacht: { customer_id: @customer_yacht.customer_id, yacht_id: @customer_yacht.yacht_id } }
    end

    assert_redirected_to customer_yacht_url(CustomerYacht.last)
  end

  test "should show customer_yacht" do
    get customer_yacht_url(@customer_yacht)
    assert_response :success
  end

  test "should get edit" do
    get edit_customer_yacht_url(@customer_yacht)
    assert_response :success
  end

  test "should update customer_yacht" do
    patch customer_yacht_url(@customer_yacht), params: { customer_yacht: { customer_id: @customer_yacht.customer_id, yacht_id: @customer_yacht.yacht_id } }
    assert_redirected_to customer_yacht_url(@customer_yacht)
  end

  test "should destroy customer_yacht" do
    assert_difference('CustomerYacht.count', -1) do
      delete customer_yacht_url(@customer_yacht)
    end

    assert_redirected_to customer_yachts_url
  end
end
