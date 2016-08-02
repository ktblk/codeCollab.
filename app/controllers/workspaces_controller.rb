class WorkspacesController < ApplicationController

  before_action :authorize

  require 'openssl'
  require 'date'
  require 'base64'

  def index
    @users_sign_in = User.where(status: true)
  end

  def gen_token
    digest = OpenSSL::Digest.new('sha256')
    secret = ENV['REPLSECRET']
    time_created = Time.now.to_i * 1000 # convert to ms
    hmac = OpenSSL::HMAC.digest(digest, secret, time_created.to_s)
    token = {
        time_created: time_created,
        msg_mac: Base64.encode64(hmac).strip
    }
    render json: token
  end



end
