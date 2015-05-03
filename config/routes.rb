Rails.application.routes.draw do
  devise_for :users
  
  resources :annotations do
    resources :comments
    member do
    	put "like", to: "annotations#upvote"
    	put "dislike", to: "annotations#downvote"
    end
  end

  resources :notebooks

  get '/top', to: 'pages#top'
  get '/notauthorized', to: 'pages#notauthorized'
  
  root to: "annotations#index"

end
