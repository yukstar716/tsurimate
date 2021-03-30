Rails.application.routes.draw do
  devise_for :users, controllers: { 
    :omniauth_callbacks => "omniauth_callbacks", 
  }
  get 'top',   to: 'static_pages#top'  
  get 'about', to: 'static_pages#about'
<<<<<<< HEAD
  get 'post',  to: 'post#new'
  #get 'post', to: 'post#create'
=======
  get 'posts',  to: 'posts#new'
>>>>>>> login
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'application#hello'
  
end
