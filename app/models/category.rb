class Category < ApplicationRecord
  validates :name, :priority, presence: true
  validates :name, length: { in: 4..30 }
  has_many :article_categories, dependent: :destroy
  has_many :articles, through: :article_categories
end
