Rails.application.routes.draw do
<<<<<<< HEAD
  resources :portfolios
  get 'pages/home'
  get 'pages/about'
  get 'pages/contact'
  resources :blogs
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
=======
>>>>>>> 0c0a09c65667b638f66d5defa33b2c627b1499bd
  resources :portfolios, except: [:show]
  get 'portfolio/:id', to: 'portfolios#show', as: 'portfolio_show'

  get 'about-me', to: 'pages#about'
  get 'contact', to: 'pages#about'

<<<<<<< HEAD
  resources :blogs
=======
  resources :blogs do
    member do
      get :toggle_status
    end
  end
>>>>>>> 0c0a09c65667b638f66d5defa33b2c627b1499bd

  root to: 'pages#home'
end
