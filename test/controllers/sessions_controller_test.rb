require "test_helper"

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get login" do
    get "/login"
    assert_response :success
  end

  test 'should logout' do
    delete '/logout', params: {}
    assert_nil session[:user_id]
    assert_redirected_to root_path
  end
end
