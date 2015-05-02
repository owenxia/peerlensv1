Rails.application.routes.draw do
  resources :annotations
  root "annotations#index"

end
