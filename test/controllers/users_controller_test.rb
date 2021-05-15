require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get register" do
    get '/users/new'
    assert_response :success
  end

  test "should get show" do
    get '/users/show/2'
    assert_response :success
  end

  test "should get forgotten" do
    get users_forgotten_url
    assert_response :success
  end
end
