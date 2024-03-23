require "test_helper"

class HomePagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get home_url
    assert_response :success
    assert_select "title", "Home | Shiftem"
  end

  test "should get admin" do
    get admin_url
    assert_response :success
    assert_select "title", "Admin | Shiftem"
  end

  test "should get member" do
    get member_url
    assert_response :success
    assert_select "title", "Member | Shiftem"
  end
end
