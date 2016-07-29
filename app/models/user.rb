class User < ApplicationRecord
  has_secure_password
  has_many :documents
  # has_many :workrooms
end
