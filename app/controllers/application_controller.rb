class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :current_user

  private

  def current_user
    return unless session[:user_id]

    @current_user = User.find_by(id: session[:user_id])
  end

  def authenticate_user
    if @current_user.nil?
      flash[:notice] = 'ログインが必要です'
      redirect_to('/login')
    end
  end

  def guest_user
    @user = User.find_by(email:'rails@taro.com')
    if @user == @current_user
      flash[:danger] = 'ゲストユーザーはこの操作はできません'
      redirect_to root_path
    end
  end
end
