module ArticlesHelper
  def featured_article
    featured_article = nil
    votes = 0
    Article.all.each do |article|
      if article.votes.size > votes
        featured_article = article
        votes = article.votes.size
      end
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

  def vote_article(user, article)
    link_to 'Vote', user_article_votes_path(user, article), method: :post
  end
end
