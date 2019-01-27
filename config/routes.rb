Rails.application.routes.draw do
  devise_for :users
  resources :tickets
  resources :events, only: %i[show index new create]

  get 'home/hello'
  get 'home/goodbye'

  root to: 'events#index'
end
