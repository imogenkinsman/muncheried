class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    #@user = User.new(user_params)
    #@user.secret_key = SecureRandom.urlsafe_base64
    #if @user.save
    #  redirect_to root_path, flash: { success: 'Email added!' }
    #else
    #  render new_user_path
    #end
    @user = User.new(user_params)
    @user.secret_key = SecureRandom.urlsafe_base64
    @user.save
    redirect_to root_path
  end

  private

    def user_params
      params.permit(:email)
    end

end