Rails.application.routes.draw do
  resources :dog_houses, only: [:show] do
    resources :reviews,only:[:show,:index]
    #This means that we want a user to see reviews in the context of a single dog house
    #The routes are generated here have a dynamic part for the dog_house and the review Id because the two change with a given doghouse
    #The actions used are those that are defined in the rview and show excellent separation of concerns and dryness
    #The reason for putting dynamic house in the url is for the purpose of giving the controller access to it.
    #Nesting routes should STRICTLY never go more than one level deep
  end
  resources :reviews, only: [:show, :index, :create]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # get "/dog_houses/:dog_house_id/reviews",to: "dog_houses#reviews_index"   - working but bad since  there are no separation of concerns
  # get "/dog_houses/:dog_house_id/reviews/:review_id", to: "dog_houses#review"  - now the doghouses view is rendering reviews which is a bad practice and too repeats the logic that is present in the reviews which is not dry


end
