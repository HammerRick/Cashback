Rails.application.routes.draw do
  get 'shop/home'
  resources :users
  resources :offers, except: :show do
    get 'switch', :on => :member
  end
end
