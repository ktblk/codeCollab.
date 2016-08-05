class NotificationsController < ApplicationController

  def create
    # 1. --> current user's (orignal user) name
    #2. --> user_id relating to person notification needs to be sent to
    #3. create a new notification where user_from params = current_user (not the one who sent the notification)
    #3.1 -> user click on url passed in params

    # {"cu_id"=>"1", "user_id"=>"2", "location"=>"http://localhost:3000/workspace#-KONhpnO8t_knWdZQy5R"}
    # User.current_user[params[:cu_id]]
    # User.person_to_notify[params[:user_id]]
    @notification = Notification.create(user_id: params[:cu_id], person_to_notify: params[:user_id], location: params[:location])
    if @notification.save
      render json: :success
    else
      render json: :error
    end

  end

  def destroy
    @notification = Notification.find_by(person_to_notify: params[:notify_id])
    location = @notification.location
    @notification.destroy
    redirect_to location
  end
end
