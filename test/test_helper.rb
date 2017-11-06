require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
  def sign_in_as_admin
    post '/sessions/login', params: {username_or_email: 'adminuser', login_password: 'password'}
  end

  def sign_in_as_user
    post '/sessions/login', params: {username_or_email: 'testuser', login_password: 'password'}
  end

  def sign_out
    get '/sessions/logout'
  end
end
