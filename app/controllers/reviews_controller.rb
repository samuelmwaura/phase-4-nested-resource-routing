class ReviewsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

  def index
    if params[:dog_house_id]  #This is the determiner to tell the action if we want all reviews or those related to a given dog_house
      dog_house = DogHouse.find(params[:dog_house_id])
      reviews = dog_house.reviews
    else
      reviews = Review.all, include: :dog_house #It also sends the detail of the doghouse that is connected  to  the review
    end
    render json: reviews, include: :dog_house
  end

  def show
    review = Review.find(params[:id])
    render json: review, include: :dog_house
  end

  def create
    review = Review.create(review_params)
    render json: review, status: :created
  end

 
  private

  def render_not_found_response
    render json: { error: "Review not found" }, status: :not_found
  end

  def review_params
    params.permit(:username, :comment, :rating)
  end

end
