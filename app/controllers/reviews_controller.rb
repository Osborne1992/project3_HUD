class ReviewsController < ApplicationController

  load_and_authorize_resource

  def index
    @reviews = Review.all.order(:title)
  end

  def show
    @review = find_review
  end

  def new
    @review = Review.new
  end

  def create
    review = current_user.reviews.create(review_params)
    review.calculate_average
    redirect_to( review )
  end

  def destroy
    review = find_review
    review.destroy
    redirect_to(reviews_path)
  end

  def edit
    @review = find_review
  end

  def update
    review = find_review
    review.update(review_params)
    redirect_to(review_path(review.id))
  end

  private

  def find_review
    Review.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:game_id, :user_id, :title, :body, :rate_average, :rate_story, :rate_difficulty, :rate_length, :rate_mechanics, :rate_audio, :rate_performance, :rate_art_style, :rate_immersion, :platform_id)
  end

end