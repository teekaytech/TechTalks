class User < ApplicationRecord
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: URI::MailTo::EMAIL_REGEXP },
                    uniqueness: { case_sensitive: false }
  validates :name, presence: true, length: { minimum: 5 }
  validates :username, presence: true, length: { maximum: 20 }
  has_many :articles, class_name: 'Article', foreign_key: 'author_id'
  has_many :votes
end
