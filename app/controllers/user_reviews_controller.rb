class UserReviewsController < ApplicationController

  def create
    @user_review = UserReview.create(user_id: current_user.id, boardgame_id: params[:boardgame_id], review: params[:review], rating: params[:rating])
    flash[:errors] = @user_review.errors.full_messages
    redirect_to boardgame_path(params[:boardgame_id])
  end
end
