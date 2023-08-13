class UsersController < ApplicationController
  before_action :is_matchin_login_user, only: [:edit, :update]
  def index
  end

  def show
    @user = User.find(params[:id])
    @profile_image = @user.profile_image
    @books = @user.books
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update
    redirect_to user_path(@user)
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image)
  end

end
