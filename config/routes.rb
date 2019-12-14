Rails.application.routes.draw do
  get 'login', to: 'sessions#login_form'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  resources :users
  resources :comments, only: %i[create destroy]
  resources :values
end
