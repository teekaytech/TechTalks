class SessionsController < ApplicationController
  def new
    @users = User.all
  end

  def create
    @user = User.find_by(username: params[:session][:username])
    if @user
      helpers.log_in(@user)
      flash[:success] = "Welcome back, #{@user.username}!"
      redirect_to users_path
    else
      flash.now[:danger] = 'Invalid username..., try again.'
      render 'new'
    end
  end

  def destroy
    helpers.log_out
    redirect_to root_url
  end
end
