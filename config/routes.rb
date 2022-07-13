Rails.application.routes.draw do

  patch 'customers' => 'public/customers#update', as: 'customer_update'

   #会員用
  devise_for :customers, skip: [:passwords], controllers: {
    registrations: 'public/registrations',
    sessions: 'public/sessions'
  }

  #管理者用
    devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: 'admin/sessions'
  }

  # resources :orders, only: [:new, :confirm, :complete, :create, :index, :show]
  # resources :addresses

  # 会員用ルーティング
  get root to: 'public/homes#top'
  get 'about' => 'public/homes#about'

  get 'items' => 'public/items#index'
  get 'items/:id'  => 'public/items#show', as: 'item'

  get 'customers' => 'public/customers#show'
  get 'customers/edit/:id' => 'public/customers#edit', as: 'customer_edit'

  get 'customers/quit' => 'public/customers#quit'
patch 'customers/exit' => 'public/customers#exit'

  get 'cart_items' => 'public/cart_items#index'
  patch 'cart_items/:id' => 'public/cart_items#update', as: 'cart_item_update'
  delete 'cart_items/:id' => 'public/cart_items#destroy', as: 'cart_item_destroy'
  delete 'cart_items' => 'public/cart_items#destroy_all', as: 'cart_item_destroy_all'
  post 'cart_items' =>  'public/cart_items#create'

  get 'orders/new' => 'public/orders#new', as: 'new_order'
  post 'orders/confirm' => 'public/orders#confirm'
  get 'orders/complete' => 'public/orders#complete', as: 'order_complete'
  post 'orders' => 'public/orders#create'
  get 'orders' => 'public/orders#index'
  get 'orders/:id' => 'public/orders#show', as: 'order'

  get 'addresses/:id' => 'public/addresses#index', as: 'addresses'
  get 'addresses/:id/edit' => 'public/addresses#edit', as: 'addresses_edit'
  post 'addresses' => 'public/addresses#create', as: 'addresses_create'
  patch 'addresses/:id' => 'public/addresses#update', as: 'addresses_update'
  delete 'addresses/:id' => 'public/addresses#destroy', as: 'addresses_destroy'

#管理者用ルーティング

  namespace :admin do
    root :to => 'homes#top'
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    get 'status/:id' => 'orders#show'
    put 'status/:id/order' => 'orders#update', as: 'order'
    put 'status/:id' => 'product_details#update', as: 'product_details'
  end



     # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end