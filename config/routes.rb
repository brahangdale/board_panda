Rails.application.routes.draw do
  #devise_for :users

  devise_for :users, controllers: {
        sessions: 'users/sessions',
        registrations: 'users/registrations',
        omniauth_callbacks: 'users/omniauth_callbacks'
      }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"

  resources :posts do
    # collection do
    #   get :art
    # end
    member do
      get :upvote
      get :downvote
      post :create_comment
    end
  end

  get 'art', to: "home#art"
  get 'photography', to: "home#photography"
  get 'animals', to: "home#animals"
  get  'travel', to: "home#travel"
  resources :users
   
end
