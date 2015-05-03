Rails.application.routes.draw do
  devise_for :users
  
  resources :annotations do
    resources :comments
  end

  resources :notebooks

  get '/top', to: 'pages#top'
  
  root to: "annotations#index"

end
