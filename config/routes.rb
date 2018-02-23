Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      # Challenges
        # Get all challenge for user to search through
        # Get individual challenge
        resources :users, only: [:show, :create, :update, :destroy]
      # Codes
        # Get all code for individual user
        resources :users, only: [:show, :create, :update, :destroy]
      # Comments
        # Get all comments for individual challenge
        resources :users, only: [:show, :create]
      # User_Challenges
        # Get challenges of individual user
        resources :users, only: [:show, :create, :update]
      # Users
        # Get general information for users
        resources :users, only: [:show, :create, :update, :destroy]

      # Session
        post '/signup', to: 'sessions#signup'
        post '/login', to: 'sessions#login'
    end
  end

end
