class WorkspacesController < ApplicationController

  before_action :authorize

  def index
    @users_sign_in = User.where(status: true)
  end
end
