require "test_helper"

class YachtsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @yacht = yachts(:one)
  end

  test "should get index" do
    get yachts_url
    assert_response :success
  end

  test "should get new" do
    get new_yacht_url
    assert_response :success
  end

  test "should create yacht" do
    assert_difference('Yacht.count') do
      post yachts_url, params: { yacht: { length: @yacht.length, name: @yacht.name, registration_number: @yacht.registration_number, sail: @yacht.sail } }
    end

    assert_redirected_to yacht_url(Yacht.last)
  end

  test "should show yacht" do
    get yacht_url(@yacht)
    assert_response :success
  end

  test "should get edit" do
    get edit_yacht_url(@yacht)
    assert_response :success
  end

  test "should update yacht" do
    patch yacht_url(@yacht), params: { yacht: { length: @yacht.length, name: @yacht.name, registration_number: @yacht.registration_number, sail: @yacht.sail } }
    assert_redirected_to yacht_url(@yacht)
  end

  test "should destroy yacht" do
    assert_difference('Yacht.count', -1) do
      delete yacht_url(@yacht)
    end

    assert_redirected_to yachts_url
  end
end
