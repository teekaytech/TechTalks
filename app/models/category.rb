class Category < ApplicationRecord
  validates :name, :priority, presence: true
  validates :name, length: { in: 4..30 }
  has_many :article_categories, dependent: :destroy
  has_many :articles, through: :article_categories

  scope :order_by_priority, -> { order(priority: :asc) }

  scope :with_articles, -> { includes(:articles) }
end
