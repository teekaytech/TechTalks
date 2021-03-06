class SessionsController < ApplicationController
  def new
    @users = User.all
  end

  def create
    @user = User.find_by(username: params[:session][:username])
    do_login(@user)
  end

  def external_auth
    @user = User.from_omniauth(request.env['omniauth.auth'])
    do_login(@user)
  end

  def failure
    flash[:error] = 'There was a problem signing you in. Please register or try signing in later.'
    redirect_to login_path
  end

  def destroy
    helpers.log_out
    redirect_to root_url
  end

  private

  def do_login(user)
    if user
      helpers.log_in(@user)
      flash[:success] = "You're logged in, #{@user.username}!"
      redirect_to users_path
    else
      flash.now[:danger] = 'Invalid username..., try again.'
      render 'new'
    end
  end
end
