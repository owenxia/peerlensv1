Rails.application.routes.draw do
  get "hashtags/:hashtag",   to: "hashtags#show",      as: :hashtag
  get "hashtags",            to: "hashtags#index",     as: :hashtags
  devise_for :users
  
  resources :annotations do
    resources :comments
    member do
    	put "like", to: "annotations#upvote"
    	put "dislike", to: "annotations#downvote"
    end
  end

  resources :users do
    member do
      get :follow
      get :unfollow
    end
  end

  resources :notebooks

  get '/top', to: 'pages#top'
  get '/notauthorized', to: 'pages#notauthorized'
  
  root to: "pages#top"

  match 'auth/:provider/callback', to: 'sessions#create', via: [:get]

end
