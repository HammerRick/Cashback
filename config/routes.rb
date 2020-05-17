Rails.application.routes.draw do
  root :to => 'shop#home' 
  get 'shop/home'
  resources :users
  resources :offers, except: :show do
    get 'switch', :on => :member
  end
end
