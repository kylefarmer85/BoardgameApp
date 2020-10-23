class UserReviewsController < ApplicationController
  skip_before_action :require_login, only: [:highest_rated]

  def create
    @user_review = UserReview.create(user_id: current_user.id, boardgame_id: params[:boardgame_id], review: params[:review], rating: params[:rating])
    if @user_review.save
      redirect_to boardgame_path(params[:boardgame_id])
    else
      flash[:errors] = @user_review.errors.full_messages
      redirect_to boardgame_path(params[:boardgame_id])
    end
  end

  def show
  end

  def destroy
    UserReview.find_by(params[:id]).destroy
    redirect_to user_review_path(current_user)
  end

  def like
    review = UserReview.find(params[:id])

    if review.thumbs == nil
      review.thumbs = 1
      review.save
    else
      review.thumbs += 1
      review.save
    end


    redirect_to boardgame_path(review.boardgame_id)
  end

  def highest_rated
    @highest_rated_games = UserReview.highest_rated
  end

end
