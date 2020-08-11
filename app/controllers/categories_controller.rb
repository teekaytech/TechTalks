class CategoriesController < ApplicationController
  before_action :authenticate_user

  def index
    @categories = Category.with_articles
  end

  def show
    @category = Category.includes(:articles).find(params[:id])
  end
end
