class UsersController < ApplicationController
  # before_action :require_login
  # skip_before_action :require_login, only: [:signup]


  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      session[:admin] = @user.admin
      redirect_to profile_path(@user)
    else
      redirect_to signup_path
    end
    # binding.pry
  end

  def show
    require_login
    set_user
  end

  def edit

  end


  private

  def set_user
    @user = User.find(params[:id])
  end

  def require_login
    redirect_to '/' unless session.include? :user_id
  end

  def passwords_match
    params[:password] == params[:password_confirmation]
  end

  def user_params
    params.require(:user).permit(:name, :height, :tickets, :nausea, :happiness, :admin, :password)
  end
end
