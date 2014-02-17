class UsersController < ApplicationController

  def create
    @user = User.new(user_params)
    @user.secret_key = SecureRandom.urlsafe_base64
    if @user.save
      response = { success: "Successfully added #{@user.email}"}
    else
      response = { error: "Unable to add #{@user.email}"}
    end

    render json: response
  end

  def unsubscribe
    user = User.find(params[:id])
    if user.secret_key = params[:key]
      user.update_attributes(subscribed: false)
    end

    redirect_to root_path, flash: { success: "Successfully unsubscribed #{user.email} from MunchAlerts" }
  end

  private

    def user_params
      params.permit(:email)
    end

end