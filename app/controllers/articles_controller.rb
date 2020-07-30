class ArticlesController < ApplicationController
  before_action :authenticate_user

  def new
    @article = current_user.articles.build
  end

  def create
    if params[:categories].nil?
      flash[:danger] = 'Please select at least one category.'
      redirect_back fallback_location: new_user_article_path
    else
      article = current_user.articles.build(article_params)
      store_article_with_categories(article, params[:categories])
    end
  end

  private

  def article_params
    params.require(:article).permit(%i[author_id title text image])
  end
end
