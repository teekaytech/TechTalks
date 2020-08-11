class UsersController < ApplicationController
  before_action :authenticate_user, only: %i[show index]
  def index
    @user = User.all
    @articles = Article.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = 'Welcome to TechTalks!'
      helpers.log_in(@user)
      redirect_to users_path
    else
      flash[:danger] = 'Unable to create your account, please try again.'
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:name, :username, :email)
  end
end
