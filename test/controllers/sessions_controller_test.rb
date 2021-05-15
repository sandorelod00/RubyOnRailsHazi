require "test_helper"

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get sessions_create_url
    assert_response :success
  end

  test "should get destroy" do
    get sessions_destroy_url
    assert_response :success
  end

  test "login" do
    get '/projects/'
    assert_response :success
    assert_select 'legend', 'Login'
    assert_nil session[:user]

    post '/sessions/create', params:{email: users(:admin).eamil, passwos: 'admin'}
    assert_response :redirect
    assert_equal session[:user], users(:admin).id
    assert_select 'a', 'Profile'
  end

  test "invalid_login" do
    get '/projects/'
    assert_response :success
    assert_select 'legend', 'Login'
    assert_nil session[:user]

    post '/sessions/create', params:{email: users(:admin).eamil, passwos: 'tiktokPoG'}
    assert_response :redirect
    assert_nil session[:user]
    assert_select 'a', 'Register'
  end

  test "logout" do
    get hello_path
    assert_response :success
    assert_select 'legend', "Login"
    assert_nil session[:user]

    post '/sessions/create', params:{email: users(:admin).eamil, passwos: 'tiktokPoG'}
    assert_response :redirect
    assert_equal session[:user], users(:admin).id
    assert_select 'a', 'Logout'

    get '/sessions/destroy', headers: {'HTTP_REFER': '/projects' }
    assert_response :redirect
    assert_nil session[:user]
    assert_select 'legend', "Login"
  end

end
