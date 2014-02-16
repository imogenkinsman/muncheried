class UsersController < ApplicationController

  def create
    @user = User.new(user_params)
    @user.secret_key = SecureRandom.urlsafe_base64 # is there a cleaner way to do this?
    if @user.save
      head :created
    else
      head :conflict
    end

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