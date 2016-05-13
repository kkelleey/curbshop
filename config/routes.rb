Curbshop::Application.routes.draw do
  devise_for :users

  root "items#index"
  get 'curb' => 'curbs#show'
  get 'about' => 'items#about'

  resources :items
  resources :bids, only: [:new, :create, :show]
  resources :users
  resources :categories
end
