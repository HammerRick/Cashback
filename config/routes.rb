Rails.application.routes.draw do
  root :to => 'shop#home' 

  resources :sessions, only: [:new, :create, :destroy]
  resources :users
  resources :offers do
    get 'switch', :on => :member
  end

  get 'click/:offer_id', to: 'shop#click', as: 'click'
  # to make ours links more user friendly
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
end
