Rails.application.routes.draw do
  resources :annotations do
    resources :comments
  end
  
  root "annotations#index"

end
