require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "new - given user not login - return new user page" do
    sign_out
    get new_user_path
    assert_response :success
  end

  test "new - given user already login - redirect to user profile page" do
    sign_in_as_user
    follow_redirect!
    assert_equal profile_user_path(2), path
    get new_user_path
    assert_response :redirect
    follow_redirect!
    assert_equal profile_user_path(2), path
  end

  test "create - given user not login and valid input - create new user" do
    sign_out
    post users_path, params: {user: {
        :name => 'Test user',
        :username => 'testusername',
        :email => 'testemail@email.com',
        :password => 'password',
        :password_confirmation => 'password'
      }}
    assert_response :redirect
  end

  test "create - given user not login and invalid input - return errors" do
    sign_out
    post users_path, params: {user: {
        :name => 'Test user',
        :username => 'testusername2',
        :email => 'invalid email',
        :password => 'password',
        :password_confirmation => 'password'
      }}
    assert_response :success
    assert_equal users_path, path
  end

  test "create - given user already login - redirect to user profile page" do
    sign_in_as_user
    follow_redirect!
    assert_equal profile_user_path(2), path
    post users_path
    assert_response :redirect
    follow_redirect!
    assert_equal profile_user_path(2), path
  end

  test "profile - given user not login - redirect to login page" do
    sign_out
    get profile_user_path(1)
    assert_response :redirect
  end

  test "profile - given user already login - return user profile" do
    sign_in_as_user
    follow_redirect!
    assert_equal profile_user_path(2), path
    get profile_user_path(2)
    assert_response :success
  end

  test "profile - given user already login and try to access another user profile - redirect to correct user profile" do
    sign_in_as_user
    follow_redirect!
    assert_equal profile_user_path(2), path
    get profile_user_path(1)
    assert_response :redirect
    follow_redirect!
    assert_equal profile_user_path(2), path
  end
end
