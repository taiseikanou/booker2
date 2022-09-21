class UsersController < ApplicationController
  def show

  end



  def index
    @users = User.all
  end

private

  def user_params
  params.require(:user).permit(:name,:image)
  end
end