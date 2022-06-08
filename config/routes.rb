Rails.application.routes.draw do


  # root :to => 'homes#top'
  get '/about' => 'public/homes#about'
  
  get 'items' => 'public/items#index'
  # get 'items/show'
  root :to => 'public/homes#top'
  resources :customers, only: [:show, :quit]
  #   #会員用
  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  
  resources :cart_items, only: [:index, :update, :destroy, :destroy_all, :create]
  # resources :orders, only: [:new, :confirm, :complete, :create, :index, :show]
  # resources :addresses
  
#管理者用ルーティング

  namespace :admin do
    get 'status/:id' => 'orders#show'
    resources :customers, only: [:index, :show, :edit, :update]
    resources :genres,    only: [:index, :create, :edit, :update]
    root :to => 'homes#top'
    resources :items
  end
  
#管理者用
    devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }
  
     # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end