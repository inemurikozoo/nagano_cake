Rails.application.routes.draw do

  #   #会員用
  devise_for :customers, skip: [:passwords], controllers: {
    registrations: 'public/registrations',
    sessions: 'public/sessions'
  }

  #管理者用
    devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  # resources :orders, only: [:new, :confirm, :complete, :create, :index, :show]
  # resources :addresses

  # 会員用ルーティング
  get 'product_details/update'
  get root to: 'public/homes#top'
  get 'about' => 'public/homes#about'
  get 'items' => 'public/items#index'
  get 'items/:id'  => 'public/items#show'
  get 'cart_items' => 'public/cart_items#index'
  get 'orders/new' => 'public/orders#new', as: 'new_order'

#管理者用ルーティング

  namespace :admin do
    get 'status/:id' => 'orders#show'
    put 'status/:id/order' => 'orders#update', as: 'order'
    put 'status/:id' => 'product_details#update', as: 'product_details'
    resources :customers, only: [:index, :show, :edit, :update]
    resources :genres,    only: [:index, :create, :edit, :update]
    root :to => 'homes#top'
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
  end



     # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end