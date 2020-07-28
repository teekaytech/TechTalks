class Article < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :votes
  has_many :categories, class_name: 'ArticleCategory', foreign_key: 'article_id'
end
