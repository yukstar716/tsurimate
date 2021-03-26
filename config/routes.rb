Rails.application.routes.draw do
  get 'top',   to: 'static_pages#top'  
  get 'about', to: 'static_pages#about'
  get 'post',  to: 'post#new'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'application#hello'
  
end
