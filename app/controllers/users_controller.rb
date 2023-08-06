class UsersController < ApplicationController
  before_action :is_matchin_login_user, only: [:edit, :update]
  def index
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
  end
end
