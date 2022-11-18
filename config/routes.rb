Rails.application.routes.draw do
  devise_for :users, :controllers => { :registrations => "registrations" }
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"

  root 'pages#home'

  scope "admin" do
    get "transactions" => "admin#transactions", as: :admin
    get "pending" => "accounts#pending", as: :pending_account
    patch "accounts/:id/approve" => "accounts#approve", as: :approve_account
    resources :accounts
  end

  scope "traders" do
    resources :stocks, only: [:new]
    get "portfolio" => "traders#portfolio", as: :traders_portfolio
    get "trending_stocks" => "traders#trending_stocks", as: :trending_stocks
    get "transactions" => "traders#transactions", as: :trader_transactions
    post "stocks" => "stocks#search", as: :search_stock
    get "stocks/:symbol" => "stocks#show", as: :stock
    get "stocks/:symbol/buy" => "transactions#buy_stock", as: :buy_stock
    get "stocks/:symbol/sell" => "transactions#sell_stock", as: :sell_stock
    post "stocks/:symbol" => "transactions#save_transaction", as: :save_transaction
  end

end
