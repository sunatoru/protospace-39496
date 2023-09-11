Rails.application.routes.draw do
  # devise導入時にルーティングも追加される
  devise_for :users
  root to: "prototypes#index"
  resources :prototypes do
    resources :comments, only: :create
  end
end
