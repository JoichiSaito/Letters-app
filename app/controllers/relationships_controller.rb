class RelationshipsController < ApplicationController
  before_action :set_target_user, only: %i[create destroy]
  before_action :authenticate_user
  
  def create
    follow = @current_user.active_relationships.build(follower_id: params[:user_id])
    follow.save
    redirect_to @user
  end
  
  def destroy
    follow = @current_user.active_relationships.find_by(follower_id: params[:user_id])
    follow.destroy
    redirect_to @user
  end
  
  private
  
  def set_target_user
    @user = User.find(params[:user_id])
  end
end
