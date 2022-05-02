Rails.application.routes.draw do
  devise_for :users
  #root to:'prototypes#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "prototypes#index"
  resources :prototypes, only: [:index, :new, :create, :edit, :update, :show, :destroy ] do
   resources :comments, only: [:index, :create]
  end
   resources :users, only: :show
end
