class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by_username(params[:username])
    if @user && @user.authenticate(params[:password])
      @user.status = true
      session[:user_id] = @user.id
      redirect_to root_path
    else
  # If user's login doesn't work, send them back to the login form.
    redirect_to documents_path
    end
  end

  def destroy
    current_user.status = false
    session[:user_id] = nil
    redirect_to login_path
  end
end
