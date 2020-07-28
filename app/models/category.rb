class Category < ApplicationRecord
  has_many :articles, class_name: 'ArticleCategory', foreign_key: 'category_id'
end
