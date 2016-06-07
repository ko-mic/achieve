Rails.application.routes.draw do
  devise_for :users
  root to: "top#index"
  get 'inquiry' => 'inquiry#index'
  post 'inquiry' => 'inquiry#index'
  post 'inquiry/confirm' => 'inquiry#confirm'
  post 'inquiry/thanks' => 'inquiry#thanks'
  resources :blogs
end
