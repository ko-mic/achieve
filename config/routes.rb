Rails.application.routes.draw do
  get 'users/index'

  get 'users/show'

  devise_for :users
  resources :users,only: [:index,:show]
  
  root to: "top#index"
  get 'inquiry' => 'inquiry#index'
  post 'inquiry' => 'inquiry#index'
  post 'inquiry/confirm' => 'inquiry#confirm'
  post 'inquiry/thanks' => 'inquiry#thanks'
  resources :blogs
end
