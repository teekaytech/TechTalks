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

  def vote_article(article)
    link_to('Vote', article_votes_path(article), method: :post)
  end

  def vote_button_message(user, article)
    if check_vote_status(user, article)
      content_tag(:span, 'Voted')
    else
      content_tag(:span, vote_article(article), class: 'v-button')
    end
  end

  def article_error_messages(article)
    return unless article.errors.any?

    render partial: 'articles/error_messages'
  end
end
