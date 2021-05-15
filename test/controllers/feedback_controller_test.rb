require "test_helper"

class FeedbackControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get feedback_new_url
    assert_response :success
  end

  test "get new" do
    get '/feedback/new/2'
    assert_response :success
  end

  test "should get create" do
    c = Comment.new createdByUserId: 3, toUserId: 2, content: 'nagyon probalkozok'
    post '/feedback/create/', params:{comment: {createdByUserId: 3, toUserId: 2, content: 'nagyon probalkozok'}}
    assert_response :redirect
  end
end
