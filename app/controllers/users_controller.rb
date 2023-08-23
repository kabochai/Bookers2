class UsersController < ApplicationController
  before_action :is_matching_login_user, only: [:edit, :update]
  def index
    @user = current_user
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    # @profile_image = @user.profile_image
    @books = @user.books
    @book = Book.new
  end

  def edit
    @user = User.find(params[:id])
    @profile_image = @user.profile_image
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to users_path(@user)
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

  def is_matching_login_user
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to books_path
    end
  end

end
