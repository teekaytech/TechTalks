class Article < ApplicationRecord
  validates :title, :text, :image, presence: true
  validates :title, length: { in: 6..50 }
  validates :text, length: { in: 20..255 }
  belongs_to :author, class_name: 'User'
  has_many :votes
  has_many :categories, class_name: 'ArticleCategory', foreign_key: 'article_id'
end
