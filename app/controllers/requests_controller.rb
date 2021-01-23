class RequestsController < ApplicationController
  before_action :set_target_user
  before_action :authenticate_user

  def show
    @users = @user.refollowers.page(params[:page])
  end

  def create
    request = @current_user.active_requests.build(refollower_id: params[:user_id])
    request.save
    redirect_to @user
  end

  def destroy
    request = @current_user.active_requests.find_by(refollower_id: params[:user_id])
    request.destroy
    redirect_to @user
  end

  private

  def set_target_user
    @user = User.find(params[:user_id])
  end
end
