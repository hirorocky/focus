class UsersController < ApplicationController
  skip_before_action :login_required, only: [:new, :create]
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      log_in(@user)
      redirect_to emotions_url, notice: "新規登録しました。"
    else
      render :new
    end
  end

  def show # TODO: system testを作る
    @user = User.find(params[:id])
    # TODO: ユーザが見つからなかった or ログインしてないならリダイレクト
  end

  def edit # TODO: system testを作る
    @user = User.find(params[:id])

  end

  def update # TODO: system testを作る
    @user = User.find(params[:id])

    if @user&.update(user_params)
      redirect_to user_url(@user), notice: "ユーザー情報を更新しました。"
    else
      render :edit
    end
  end

  def destroy # TODO: system testを作る
    @user = User.find(params[:id])
    @user&.destroy
    redirect_to root_url, notice: 'ユーザーを削除しました。'
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :admin, :password, :password_confirmation)
  end
end
