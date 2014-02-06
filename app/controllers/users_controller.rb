class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path, notice: 'Success!'
    else
      redirect_to root_path, notice: 'Failure!'
    end
  end

  private

    def user_params
      params.require(:user).permit(:email)
    end

end