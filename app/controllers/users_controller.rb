class UsersController < ApplicationController
  def index
    @users = User.order(karma: :desc).page(params[:page])
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :avatar)
  end
end
