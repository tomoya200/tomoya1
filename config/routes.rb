Rails.application.routes.draw do
  devise_for :users
  get 'posts/top' => 'posts#top'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: [:show]
  resources :posts do
    resources :likes, only: [:create, :destroy]
  end
  
  resources :perfumes
  root 'posts#index'
  post 'posts' => 'posts#create'
  get 'posts/:id' => 'posts#show'
  patch 'posts/:id' => 'posts#update'
  delete 'posts/:id' => 'posts#destroy'
  get 'posts/:id/edit' => 'posts#edit', as:'edit_tweet'
end
