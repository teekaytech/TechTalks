class ApplicationController < ActionController::Base
  def authenticate_user
    return unless helpers.current_user.nil?

    flash.now[:danger] = 'You need to login'
    redirect_to login_path
  end
end
