class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:homepage]


  def homepage
    unless current_user
      @users = User.all
    else
      @user = current_user
      @followings = @user.following
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def alluser
    @users = User.all
  end

end
