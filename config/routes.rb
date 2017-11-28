Rails.application.routes.draw do
  root "questions#index"

  resources :questions do
    resources :answers, only: [:index, :new, :create]
  end

  resources :answers, only: [:show, :update]

  resources :sessions, only: [:create, :destroy]
  get "auth/:provider/callback", to: "sessions#create"
  get 'auth/failure', to: redirect('/')
  delete 'signout', to: 'sessions#destroy', as: 'signout'
end
