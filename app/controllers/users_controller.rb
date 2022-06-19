class UsersController < ApplicationController
  before_action :set_current_user, {only: [:index, :show, :edit, :update]}
  before_action :authenticate_user, {only: [:index, :show, :edit, :update]}
  
  def index
    @users = User.all
  end
  
  def show
    @user = User.find_by(id: params[:id])
  end
  
  def login_form
  end
  
  def edit
    @user = User.find_by(id: params[:id])
  end
  
  def login
    @user = User.find_by(email: params[:email], password: params[:password])
    if @user
      session[:user_id] = @user.id
      flash[:notice] = "ログインしました"
      redirect_to("/users/index")
    else
      @error_message = "パスワードまたはメールアドレスが間違っています"
      @email = params[:email]
      @password = params[:password]
      render("users/login_form")
    end
  end
  
  def logout
    session[:user_id] = nil
    flash[:notice] = "ログアウトしました"
    redirect_to("/login")
  end
  
end


