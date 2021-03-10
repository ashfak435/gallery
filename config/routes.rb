Rails.application.routes.draw do
  
  
  devise_for :admins
 
  
  root to: 'home#index'


  resources :albums do
  member do
    delete "delete_upload/:upload_id", action: :delete_upload, as: :delete_upload
  end
end
 
  resources :albums
  resources :home
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
