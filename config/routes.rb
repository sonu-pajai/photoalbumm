Rails.application.routes.draw do

  root 'site#index'
  
  devise_for :users

  resources :albums do
    resources :photos
  end

  get '/userprofile/:id', to: 'site#userprofile'
  get '/album-listing', to: 'site#album_listing'

end
