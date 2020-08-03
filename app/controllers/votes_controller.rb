class VotesController < ApplicationController
  before_action :authenticate_user
  def create
    @vote = Vote.new(vote_params)
    return unless @vote.save

    flash[:success] = 'Voting successful'
    redirect_to users_path
  end

  private

  def vote_params
    params.permit(%i[user_id article_id])
  end
end
