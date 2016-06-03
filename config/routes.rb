Rails.application.routes.draw do
  root to: "top#index"
  get 'inquiry' => 'inquiry#index'
  post 'inquiry/confirm' => 'inquiry#confirm'
  post 'inquiry/thanks' => 'inquiry#thanks'
  resources :blogs
end
