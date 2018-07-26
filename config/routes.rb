Rails.application.routes.draw do
  resources :portfolios
  get 'pages/home'
  get 'pages/about'
  get 'pages/contact'
  resources :blogs
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :portfolios, except: [:show]
  get 'portfolio/:id', to: 'portfolios#show', as: 'portfolio_show'

  get 'about-me', to: 'pages#about'
  get 'contact', to: 'pages#about'

  resources :blogs do
    member do
      get :toggle_status
    end
  end

  root to: 'pages#home'
end
