Rails.application.routes.draw do
  root 'homes#top'
  get 'login', to: 'sessions#login_form'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  resources :users
  resources :comments, only: %i[create destroy]
  resources :values
end
