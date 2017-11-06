require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "new - given user not login - return new user page" do
    sign_out
    get '/users/new'
    assert_response :success
  end

  test "new - given user already login - redirect to user profile page" do
    sign_in_as_user
    follow_redirect!
    assert_equal "/users/2/profile", path
    get '/users/new'
    assert_response :redirect
    follow_redirect!
    assert_equal "/users/2/profile", path
  end

  test "create - given user not login and valid input - create new user" do
    sign_out
    post '/users/create', params: {user: {
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
    post '/users/create', params: {user: {
        :name => 'Test user',
        :username => 'testusername2',
        :email => 'invalid email',
        :password => 'password',
        :password_confirmation => 'password'
      }}
    assert_response :success
    assert_equal "/users/create", path
  end

  test "create - given user already login - redirect to user profile page" do
    sign_in_as_user
    follow_redirect!
    assert_equal "/users/2/profile", path
    post '/users/create'
    assert_response :redirect
    follow_redirect!
    assert_equal "/users/2/profile", path
  end

  test "profile - given user not login - redirect to login page" do
    sign_out
    get '/users/1/profile'
    assert_response :redirect
  end

  test "profile - given user already login - return user profile" do
    sign_in_as_user
    follow_redirect!
    assert_equal "/users/2/profile", path
    get '/users/2/profile'
    assert_response :success
  end

  test "profile - given user already login and try to access another user profile - redirect to correct user profile" do
    sign_in_as_user
    follow_redirect!
    assert_equal "/users/2/profile", path
    get '/users/1/profile'
    assert_response :redirect
    follow_redirect!
    assert_equal "/users/2/profile", path
  end
end
