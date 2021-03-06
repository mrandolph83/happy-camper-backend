Rails.application.routes.draw do
  
post "/api/v1/login", to: "api/v1/sessions#create"
post "/api/v1/signup", to: "api/v1/users#create"
delete "/api/v1/logout", to: "api/v1/sessions#destroy"
post "/api/v1/rec_area_search", to: "api/v1/rec_areas#rec_area_search"
get "/api/v1/get_current_user", to: "api/v1/sessions#get_current_user"
post "/api/v1/add_user_favorite", to: "api/v1/user_favorites#create"

  namespace :api do
    namespace :v1 do
      resources :rec_areas, only: [:show, :index]
      resources :user_favorites
      resources :reviews 
      resources :users
  end 
end 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
