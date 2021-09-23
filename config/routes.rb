Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :rec_areas
      resources :user_favorites
      resources :reviews 
      resources :users
  end 
end 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
