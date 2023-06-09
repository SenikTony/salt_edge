Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  devise_for :users, controllers: { registrations: "users/registrations" }

  # Defines the root path route ("/")
  root "connections#index"

  resource :user_profiles, only: [:show, :update]
  resource :connections, only: [:new, :destroy, :update]

  resources :connections, except: [:index, :show, :new, :create, :update, :destroy] do
    resources :accounts, only: :index, controller: "connections/accounts"
  end

  resources :accounts, except: [:index, :show, :new, :create, :update, :destroy] do
    resources :transactions, only: :index, controller: "connections/accounts/transactions"
  end
end
