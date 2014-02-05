class UsersController < ApplicationController

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = 'Success!'
    end
    redirect_to root
  end

  private

    def user_params
      params.require(:user).permit(:email)
    end

end