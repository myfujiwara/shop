class UsersController < ApplicationController

  before_action :authorize, except: [:new, :create, :sign_in, :sign_in_process]

  def new
    @user = User.new
    render layout: "not_login"
  end

  def create
    user = User.new(user_params)
    if user.save
      user_sign_in(user)
      flash[:success] = 'ユーザー登録しました'
      redirect_to sign_in_path and return
    else
      flash[:danger] = 'ユーザー登録できませんでした'
      redirect_to users_new_path
    end
  end

  def sign_in
    @user = User.new
    render layout: "not_login"
  end

  def sign_in_process
    password_md5 = User.generate_password(user_params[:password])
    user = User.find_by(email: user_params[:email], password: password_md5)

    if user
      user_sign_in(user)
      redirect_to products_path and return
    else
      flash[:danger] = 'ログインに失敗しました'
      redirect_to sign_in_path
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.save
      flash[:success] = '名前を変更しました'
      redirect_to products_path
    else
      flash.now[:danger] = '名前の変更に失敗しました'
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:name,:email,:password)
  end
end
