Rails.application.routes.draw do
  get 'orders/index'
  get 'orders/create'
  get 'order/index'
  get 'order/create'
  devise_for :users
  root to: 'items#index'
  resources :items
end
