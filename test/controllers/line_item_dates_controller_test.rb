require "test_helper"

class LineItemDatesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get line_item_dates_create_url
    assert_response :success
  end

  test "should get update" do
    get line_item_dates_update_url
    assert_response :success
  end

  test "should get destroy" do
    get line_item_dates_destroy_url
    assert_response :success
  end
end
