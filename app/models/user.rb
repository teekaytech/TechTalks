class User < ApplicationRecord
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :name, presence: true, length: { minimum: 5 }
  validates :username, presence: true, length: { maximum: 20 },
                       uniqueness: { case_sensitive: false }
  has_many :articles, class_name: 'Article', foreign_key: 'author_id',
                      dependent: :destroy
  has_many :votes, dependent: :destroy

  def self.from_omniauth(auth)
    username = auth['info']['nickname']
    where(username: username).first || create_from_omniauth(auth)
  end

  def self.create_from_omniauth(auth)
    create! do |user|
      user.name = auth['info']['name']
      user.username = auth['info']['nickname'] || auth['extra']['raw_info']['given_name']
      user.email = auth['info']['email'] || 'user@email.com'
    end
  end
end
