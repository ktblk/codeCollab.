class User < ApplicationRecord
  has_secure_password
  has_many :documents
  # has_many :workrooms

  def full_name
    "#{self.first_name.capitalize} #{self.last_name.capitalize}"
  end

end
