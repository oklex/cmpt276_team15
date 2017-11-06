require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "save - given user without login, username, email or password - should fail" do
    user = user = User.new
    assert_not user.save
  end

  test "save - given user with password_confirmation not matched password - should fail" do
    user = User.create({
        :username => 'testuser',
        :email => 'email@email.com',
        :password => 'password1',
        :password_confirmation => 'password2'
    })
    assert_not user.save
  end

  test "save - given user with too short password (< 6 characters) - should fail" do
    user = User.create({
        :username => 'testuser',
        :email => 'email@email.com',
        :password => 'pas',
        :password_confirmation => 'pas'
    })
    assert_not user.save
  end

  test "save - given user with too long password (> 20 characters) - should fail" do
    user = User.create({
        :username => 'testuser',
        :email => 'email@email.com',
        :password => 'thisisanextremelylongpasswordthatihavejustcreated',
        :password_confirmation => 'thisisanextremelylongpasswordthatihavejustcreated'
    })
    assert_not user.save
  end

  test "save - given user with invalid email - should fail" do
    user = User.create({
        :username => 'testuser',
        :email => 'email.com',
        :password => 'password',
        :password_confirmation => 'password'
    })
    assert_not user.save
  end

  test "save - given valid user - should encrypt password with random salt" do
    user = User.create({
        :username => 'testvaliduser',
        :email => 'testvaliduser@email.com',
        :password => 'password',
        :password_confirmation => 'password'
    })
    assert user.save
    assert_not_empty user[:salt]
    assert_not_empty user[:encrypted_password]
    assert_not_equal 'password', user[:encrypted_password]
  end

  # TODO: write this test
  test "authenticate - given username and valid password - return user" do
    assert true
  end

  # TODO: write this test
  test "authenticate - given username and invalid password - return false" do
    assert true
  end

  # TODO: write this test
  test "authenticate - given email and valid password - return user" do
    assert true
  end

  # TODO: write this test
  test "authenticate - given email and invalid password - return false" do
    assert true
  end
end
