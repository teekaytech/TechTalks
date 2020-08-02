module ArticlesHelper
  def featured_article
    featured_article = nil
    votes = 0
    Article.all.each do |article|
      featured_article = article if article.votes.size > votes
    end
    featured_article
  end

  def recent_article(article)
    most_recent = article.maximum('created_at')
    article.where(created_at: most_recent).first
  end

  def check_vote_status(user, article)
    article.votes.exists?(user_id: user.id)
  end
end
