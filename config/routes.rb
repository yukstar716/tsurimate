Rails.application.routes.draw do
  get 'form', to: 'post_form#new'
  get 'top', to: 'static_pages#top'  
  get 'about', to: 'static_pages#about'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'application#hello'
  
end
