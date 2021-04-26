Rails.application.routes.draw do
  devise_for :users, controllers: { 
    :omniauth_callbacks => "omniauth_callbacks"
   }
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  get 'top',    to: 'posts#index'  
  get 'about',  to: 'static_pages#about'
  get 'posts',  to: 'posts#new'
  get 'posts',  to: 'posts#show'
  get 'users',  to: 'users#show'
  
  resources :posts do
    resources :post_comments,          only: [:create, :destroy] do #, shallow: true
      resources :post_comment_replies, only: [:create, :destroy]
    end
  end
  resources :users, only: [:show, :edit, :update]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'application#hello'
  
end
