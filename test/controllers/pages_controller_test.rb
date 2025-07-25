require "test_helper"

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get "/"
    assert_response :success
  end

  test "should get about" do
    get "/about"
    assert_response :success
  end
end
