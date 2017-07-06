class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:homepage]


  def homepage
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

end
