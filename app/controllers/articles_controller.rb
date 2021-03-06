class ArticlesController < ApplicationController
  before_action :authenticate_user

  def new
    @article = current_user.articles.build
  end

  def create
    @article = current_user.articles.build(article_params)
    if @article.check_category(params[:categories])
      flash[:danger] = 'Please select at least one category.'
      render action: :new
    else
      store_article_with_categories(@article, params[:categories])
    end
  end

  def show
    @article = Article.includes(%i[author votes]).find(params[:id])
  end

  private

  def article_params
    params.require(:article).permit(%i[author_id title text image], [:categories])
  end
end
