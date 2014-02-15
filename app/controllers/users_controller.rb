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

  private

    def user_params
      params.permit(:email)
    end

end