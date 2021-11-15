require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  test 'should redirect to root' do
    get user_path(/\d*/)
    assert_redirected_to root_path
  end

  # test 'should create user' do
  #   assert_difference('User.count') do
  #     post :create, params: {user: {username: 'test', password: 'test', email: 'test@test' } }
  #   end
  # end
end
