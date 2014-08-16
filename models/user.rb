require "sequel"
require "bcrypt"

class User < Sequel::Model
  include BCrypt

  def self.find_by_username(username)
    where(:username => username).first
  end

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end
end