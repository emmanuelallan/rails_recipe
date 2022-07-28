Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }
  resources :foods
  resources :public_recipes
  resources :recipes
  resources :foods_recipes
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  devise_scope :user do
    root to: "devise/sessions#new"
  end

  get '/user' => "foods#index", :as => :user_root


end
