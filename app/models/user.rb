class User < ApplicationRecord
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :name, presence: true, length: { minimum: 5 }
  validates :username, presence: true, length: { maximum: 20 },
                       uniqueness: { case_sensitive: false }
  has_many :articles, class_name: 'Article', foreign_key: 'author_id',
                      dependent: :destroy
  has_many :votes, dependent: :destroy
end
