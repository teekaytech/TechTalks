module CategoriesHelper
  def categories
    Category.order(name: :asc)
  end
end
