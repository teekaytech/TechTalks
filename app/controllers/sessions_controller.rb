class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(username: params[:session][:username])
    if @user
      helpers.log_in @user
      flash.notice = "Welcome back, #{@user.username}!"
      redirect_to @user
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
