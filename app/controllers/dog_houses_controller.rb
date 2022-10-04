class DogHousesController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

  def show
    dog_house = DogHouse.find(params[:id])
    render json: dog_house
  end

#   #getting all the reviews that are related to a dog_house
#   def reviews_index
#     dog_house = DogHouse.find(params[:dog_house_id])
#     reviews = dog_house.reviews
#     render json: reviews, include: :dog_house
#   end

#   #Getting a certain review that is related tp a given dog house
#  def review #But now the dogs controller has reviews which means tat there is no separation of concerns
#   review = Review.find(params[:id])
#   render json: review, include: :dog_house
#  end

  private

  def render_not_found_response
    render json: { error: "Dog house not found" }, status: :not_found
  end

end
