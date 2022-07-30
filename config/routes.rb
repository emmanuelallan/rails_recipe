Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }
  resources :foods
  resources :public_recipes
  resources :shopping_lists
  resources :recipes do
    resources :recipe_foods
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  devise_scope :user do
    root to: "devise/sessions#new"
  end

  get '/user' => "foods#index", :as => :user_root


end
