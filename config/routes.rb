Rails.application.routes.draw do
  resources :topics, only: [:index, :show, :new, :create, :destroy]
  resources :skills, only: [:index, :show, :new, :create, :destroy]
  #resources :comments
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' }
  resources :portfolios, except: [:show]
  get 'portfolio/:id', to: 'portfolios#show', as: 'portfolio_show'
  get 'angular-items', to: 'portfolios#angular'

  get 'about-me', to: 'pages#about'
  get 'contact', to: 'pages#contact'
  get 'tech-news', to: 'pages#tech_news'

  resources :blogs do 
    resources :comments
    member do 
      get :toggle_status
    end
  end

  #mount ActionCable.server => '/cable'

  root "pages#home"
  match "*path" => redirect("/"), via: :get
end
