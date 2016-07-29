class WorkspacesController < ApplicationController
  def index
    @users_sign_in = User.where(status: true)
  end
end
