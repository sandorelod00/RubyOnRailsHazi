require "test_helper"

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test "login" do
    get '/'
    assert_response :success
    assert_select 'legend', 'Login'
    assert_nil session[:user]

    post '/sessions/create', params:{email: users(:admin).email, password: 'admin'}, headers: {'HTTP_REFER': '/'}
    assert_equal session[:user], users(:admin).id
  end

  test "invalid_login" do
    get '/'
    assert_response :success
    assert_select 'legend', 'Login'
    assert_nil session[:user]

    post '/sessions/create', params:{email: users(:admin).email, password: 'alma'}
    assert_response :redirect
    assert_nil session[:user]
  end

  test "logout" do
    get '/'
    assert_response :success
    assert_select 'legend', "Login"
    assert_nil session[:user]

    post '/sessions/create', params:{email: users(:admin).email, password: 'admin'}
    assert_equal session[:user], users(:admin).id
    follow_redirect!

    assert_select 'a', 'Logout'

    get '/sessions/destroy', headers: {'HTTP_REFER': '/projects' }
    assert_nil session[:user]
    follow_redirect!
    assert_select 'legend', "Login"
  end

end
