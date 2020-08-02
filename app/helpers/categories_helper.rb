module CategoriesHelper
  def categories
    Category.order(name: :asc)
  end

  def category_with_recent_article(category)
    return false if category.articles.nil?

    recent_article(category.articles)
  end

  
end
