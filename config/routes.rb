Rails.application.routes.draw do
  root 'home_page#landing_page'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  post 'room/search_room'
  post 'room/room_slots'
  post 'room/make_booking'
end
