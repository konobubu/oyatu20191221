Rails.application.routes.draw do
  get 'passwords/edit'
  root "members#index"
  get "/login" => "tops#login"

  resources :members do
    get "search", on: :collection
  end

  resources :articles

  resource :session, only: [:create, :destroy]
  resource :account, only: [:show, :edit, :update]
  resource :password, only: [:show, :edit, :update]
end
