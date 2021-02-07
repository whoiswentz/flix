class ReviewsController < ApplicationController
  before_action :set_review

  def index
    @reviews = @movie.reviews
  end

  def new
    @review = @movie.reviews.new
  end

  def create
    @review = @movie.reviews.new(review_params)

    if @review.save
      redirect_to movie_reviews_url, notice: 'Thanks for the review'
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:name, :comment, :stars)
  end

  def set_review
    @movie = Movie.find(params[:movie_id])
  end
end
