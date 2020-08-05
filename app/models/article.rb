class Article < ApplicationRecord
  validates :title, presence: true, length: { minimum: 6 }
  validates :text, presence: true, length: { minimum: 20 }
  mount_uploader :image, ImageUploader
  validates_processing_of :image
  validate :image_size_validation

  belongs_to :author, class_name: 'User'
  has_many :votes, dependent: :destroy
  has_many :article_categories, dependent: :destroy
  has_many :categories, through: :article_categories

  scope :sort_by_most_recent, -> { order(created_at: :desc) }

  private

  def image_size_validation
    return true unless image.size > 0.5.megabytes

    errors[:image] << 'should not be more than 500KB'
  end
end
