class User < ApplicationRecord
  attr_accessor :password, :gguser

  EMAIL_REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

  validates :username, :presence => true, :uniqueness => true, :length => { :in => 3..20 }
  validates :email, :presence => true, :uniqueness => true, format: { :with => EMAIL_REGEX }
  validates :password, :confirmation => true, :on => :create, unless: :gguser #password_confirmation attr
  validates_length_of :password, :in => 6..20, :on => :create, unless: :gguser

  before_save :encrypt_password
  after_save :clear_password

  def encrypt_password
    if password.present?
      self.salt = BCrypt::Engine.generate_salt
      self.encrypted_password = BCrypt::Engine.hash_secret(password, salt)
    end
  end

  def clear_password
    self.password = nil
    self.password_confirmation = nil
  end

  def self.authenticate(username_or_email="", login_password="")
    # User can login using username and password
    # We need to check whether email or username is being used
    if EMAIL_REGEX.match(username_or_email)
      user = User.find_by_email(username_or_email)
    else
      user = User.find_by_username(username_or_email)
    end

    if user && user.match_password(login_password)
      return user
    else
      return false
    end
  end

  def match_password(login_password="")
    encrypted_password == BCrypt::Engine.hash_secret(login_password, salt)
  end

end
