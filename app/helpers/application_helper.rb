module ApplicationHelper
  def categories_by_priority
    Category.order_by_priority
  end

  def category_recent_article(category)
    return unless category.articles.recent_article.nil?

    category.articles.recent_article
  end
end
