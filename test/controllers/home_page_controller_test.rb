require "test_helper"

class HomePageControllerTest < ActionDispatch::IntegrationTest
  test "should get landing_page" do
    get home_page_landing_page_url
    assert_response :success
  end
end
