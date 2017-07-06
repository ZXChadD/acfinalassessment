class RelationshipsController < ApplicationController
  def create
    user = User.find(params[:followee_id])
    current_user.following.create(followee: user)
    redirect_to user_path(user)
  end
  def destroy
    user = Relationship.find(params[:id]).followee
    current_user.following.find_by(followee: user).destroy
    redirect_to user_path(user)
  end
end
