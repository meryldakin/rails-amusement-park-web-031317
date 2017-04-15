class SessionsController < ApplicationController
  def index

  end

  def new

  end

  def create
    if params[:user][:password].present? && params[:user][:name].present?
      @user = User.find_by(name: params[:user][:name])
      if @user.try(:authenticate, params[:user][:password])
        session[:user_id] = @user.id
        session[:admin] = @user.admin
        redirect_to profile_path(@user)
      else
        redirect_to '/'
      end
    else
      redirect_to '/'
    end
  end

  def destroy
    session.clear
    redirect_to '/'
  end
end
