class Article < ApplicationRecord
  validates :title, :text, :image, presence: true
  validates :title, length: { in: 6..50 }
  validates :text, length: { in: 20..255 }
  validates :image, format: { with: %r{.(png|jpg|jpeg)$}i, multiline: true,
                              message: 'Image must be gif, png or jpg format' }

  belongs_to :author, class_name: 'User'
  has_many :votes, dependent: :destroy
  has_many :article_categories, dependent: :destroy
  has_many :categories, through: :article_categories

  def self.create_article_with_categories(article, categories)
    if article.save
      categories.each_value do |cat_id|
        ArticleCategory.create(article_id: article.id, category_id: cat_id)
      end
      flash[:success] = 'Article created successfully.'
      redirect_to root_path
    else
      flash[:danger] = 'Article could not be created, please try again.'
      redirect_back fallback_location: new_user_article_path
    end
  end
end
