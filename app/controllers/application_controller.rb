class ApplicationController < ActionController::Base
  def authenticate_user
    return unless helpers.current_user.nil?

    flash.notice = 'You need to login'
    redirect_to login_path
  end
end
