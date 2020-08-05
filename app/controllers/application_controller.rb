class ApplicationController < ActionController::Base
  helper_method :current_user

  def authenticate_user
    return unless helpers.current_user.nil?

    flash[:info] = 'You need to login'
    redirect_to login_path
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def store_article_with_categories(article, categories)
    if article.save
      categories.each_value do |cat_id|
        article.article_categories.build(category_id: cat_id).save
      end
      flash[:success] = 'Article created successfully.'
      redirect_to users_path
    else
      flash[:danger] = 'Article could not be created, please try again.'
      render action: :new
    end
  end
end
