class UsersController < ApplicationController
  def show
    @book = Book.new
    @user = current_user
    @users = User.find(params[:id])
    @books = @users.books
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(current_user.id)
  end

  def edit
    @user = User.find(params[:id])
  end

  def index
    @users = User.all
    @book = Book.new
    @user = current_user
  end

private

  def user_params
  params.require(:user).permit(:name,:image,:introduction, :profile_image)
  end
end