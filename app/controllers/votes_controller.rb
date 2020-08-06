class VotesController < ApplicationController
  before_action :authenticate_user
  def create
    @vote = current_user.votes.build(article_id: params[:article_id])
    if @vote.save
      flash[:info] = 'Voting successful'
      redirect_to users_path
    else
      flash[:danger] = 'Unable to save vote, please try again.'
      redirect_to article_path(params[:article_id])
    end
  end
end
