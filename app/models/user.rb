require 'securerandom'

class User < ApplicationRecord
  has_secure_password

  validates :email_address, :uniqueness => { :case_sensitive => false }

  def set_random_password
    temp_password = SecureRandom.hex(8)
    self.password = temp_password
    self.save
    temp_password
  end
end
