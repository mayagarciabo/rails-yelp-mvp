class ReviewsController < ApplicationController
  before_action :set_review, only: %i[new create]

  def index
  end

  def new
    @reviews = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.restaurant_id = @restaurant_id
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end

  def set_review
    @restaurant = Restaurant.find(params[restaurant_id])
  end
end
