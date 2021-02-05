class UsersController < ApplicationController
  before_action :set_target_user, only: %i[show edit update destroy follows followers]
  before_action :authenticate_user, only: %i[show edit update destroy follows followers]
  before_action :ensure_correct_user, only: %i[edit update]

  def new
    @user = User.new(flash[:user])
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to mypage_path
    else
      redirect_to new_user_path, flash: {
        user: user,
        error_messages: user.errors.full_messages
      }
    end
  end

  def index
    @q = User.where('name like ?','%学校%').order('id DESC').ransack(params[:q])
    @users = @q.result(distinct: true).page(params[:page])
  end

  def show
    @board = Board.where(user_id: @user.id).order('id DESC')
    @boards = @board.page(params[:page])
  end

  def edit; end

  def update
    if @user.update(user_params)
      flash[:notice] = 'ユーザー情報を更新しました'
      redirect_to mypage_path
    else
      redirect_to edit_user_path, flash: {
        board: @user,
        error_messages: @user.errors.full_messages
      }
    end
  end

  def follows
    @users = @user.followings.page(params[:page])
  end

  def followers
    @users = @user.followers.page(params[:page])
  end

  private

  def ensure_correct_user
    @user = User.find_by(id: params[:id])
    if @user.id != @current_user.id || @current_user.email == 'rails@taro.com'
      flash[:notice] = '権限がありません'
      redirect_to root_path
    end
  end

  def set_target_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :private)
  end
end
