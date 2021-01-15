require "test_helper"

class MarinasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @marina = marinas(:one)
  end

  test "should get index" do
    get marinas_url
    assert_response :success
  end

  test "should get new" do
    get new_marina_url
    assert_response :success
  end

  test "should create marina" do
    assert_difference('Marina.count') do
      post marinas_url, params: { marina: { address_line_1: @marina.address_line_1, address_line_2: @marina.address_line_2, city: @marina.city, description: @marina.description, state: @marina.state, zip: @marina.zip } }
    end

    assert_redirected_to marina_url(Marina.last)
  end

  test "should show marina" do
    get marina_url(@marina)
    assert_response :success
  end

  test "should get edit" do
    get edit_marina_url(@marina)
    assert_response :success
  end

  test "should update marina" do
    patch marina_url(@marina), params: { marina: { address_line_1: @marina.address_line_1, address_line_2: @marina.address_line_2, city: @marina.city, description: @marina.description, state: @marina.state, zip: @marina.zip } }
    assert_redirected_to marina_url(@marina)
  end

  test "should destroy marina" do
    assert_difference('Marina.count', -1) do
      delete marina_url(@marina)
    end

    assert_redirected_to marinas_url
  end
end
