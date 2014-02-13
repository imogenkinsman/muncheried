class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.secret_key = SecureRandom.urlsafe_base64 # is there a cleaner way to do this?
    @user.save
  end

  private

    def user_params
      params.permit(:email)
    end

end