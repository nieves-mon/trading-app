Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root 'pages#home'

  scope "admin" do
    get "dashboard" => "admin#dashboard", as: :admin
    resources :accounts
    get "pending" => "accounts#pending", as: :pending_account
    patch "accounts/:id/approve" => "accounts#approve", as: :approve_account

  end

  scope "traders" do
    get "dashboard" => "traders#dashboard", as: :traders_dashboard
    get "trending_stocks" => "traders#trending_stocks", as: :trending_stocks
    post "stocks" => "stocks#search", as: :search_stock
    get "stocks/:symbol" => "stocks#show", as: :stock
  end


end
