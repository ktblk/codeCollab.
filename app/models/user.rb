class User < ApplicationRecord
  has_secure_password
  has_many :documents
  has_many :notifications

  has_many :workrooms, through: :documents


  # validates_presence_of :first_name
  # validates_presence_of :last_name

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      # user.email = auth.info.email
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.new_random_password
      user.save!
    end
  end

  # https://dzone.com/articles/generate-random-password-ruby
  def new_random_password
    self.password = Digest::SHA1.hexdigest("--#{Time.now.to_s}--#{name}--")[0,6]
    self.password_confirmation = self.password
  end

  def full_name
    (self.first_name.capitalize + " " + self.last_name.capitalize) rescue nil
  end

end
