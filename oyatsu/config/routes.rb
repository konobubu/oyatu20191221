Rails.application.routes.draw do
  root "members#index"
  get "/login" => "tops#login"

  resources :members do
    get "search", on: :collection
  end

  resource :session, only: [:create, :destroy]
end
