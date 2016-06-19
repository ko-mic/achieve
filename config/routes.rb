Rails.application.routes.draw do
  get 'about/company_overview'

  get 'users/index'
  get 'users/show'

  devise_for :users, controllers: {
  sessions: "users/sessions",
  registrations: "users/registrations",
  passwords: "users/passwords",
  omniauth_callbacks: "users/omniauth_callbacks"
}

  resources :users,only: [:index,:show]
  
  root to: "top#index"

  get 'inquiry' => 'inquiry#index'
  post 'inquiry' => 'inquiry#index'
  post 'inquiry/confirm' => 'inquiry#confirm'
  post 'inquiry/thanks' => 'inquiry#thanks'

  resources :blogs
  
  get 'about' => 'about#company_overview'
end
