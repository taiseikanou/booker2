class UsersController < ApplicationController
  def show
    @book = Book.new
    @user = User.find(params[:id])
    @books = @user.books
  end

  def update
    @user = User.find(params[:id])
    if@user.update(user_params)
      redirect_to user_path(current_user.id)
    flash[:hoge] = "You have updated user successfully."
    else
      render :edit
    end
  end

  def edit
    @user = User.find(params[:id])
    if @user == current_user
      render :edit
    else
      redirect_to user_path(current_user.id)
    end
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