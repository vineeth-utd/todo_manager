class User < ApplicationRecord
  has_secure_password
  has_many :todos

  def to_pleasant_string
    "#{first_name} #{last_name} #{email} #{password_digest}"
  end
end
