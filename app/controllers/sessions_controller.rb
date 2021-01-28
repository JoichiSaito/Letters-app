class SessionsController < ApplicationController
  before_action :authenticate_user, only: %i[me destroy]
  
  def me
    @board = @current_user.boards.order('id DESC')
    @boards = @board.page(params[:page])
  end

  def new; end

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:notice] = 'ログインしました'
      redirect_to mypage_path
    else
      flash[:notice] = 'もう一度入力してください'
      redirect_to login_path
    end
  end

  def destroy
    session.delete(:user_id)
    flash[:notice] = 'ログアウトしました'
    redirect_to root_path
  end
end
