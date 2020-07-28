class Category < ApplicationRecord
  validates :name, :priority, presence: true
  validates :name, length: { in: 4..30 }
  has_many :articles, class_name: 'ArticleCategory', foreign_key: 'category_id'
end
