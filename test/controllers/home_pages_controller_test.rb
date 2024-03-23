require "test_helper"

class HomePagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get home_pages_home_url
    assert_response :success
    assert_select "title", "Home | Shiftem"
  end

  test "should get admin" do
    get home_pages_admin_url
    assert_response :success
    assert_select "title", "Admin | Shiftem"
  end

  test "should get member" do
    get home_pages_member_url
    assert_response :success
    assert_select "title", "Member | Shiftem"
  end
end
