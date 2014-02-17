class UsersController < ApplicationController

  def create
    @user = User.new(user_params)
    @user.secret_key = SecureRandom.urlsafe_base64
    if @user.save
      response = { type: 'success', message: "Successfully added #{@user.email}"}
    else
      response = { type: 'error', message: "Unable to add #{@user.email}"}
    end

    render json: response
  end

  def unsubscribe
    user = User.find(params[:id])
    if user.secret_key == params[:key]
      user.update_attributes(subscribed: false)
      flash[:success] = "Successfully unsubscribed #{user.email} from MunchAlerts"
    end

    redirect_to root_path
  end

  private

    def user_params
      params.permit(:email)
    end

end