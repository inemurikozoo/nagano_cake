Rails.application.routes.draw do

  namespace :public do
    resources :addresses, only: [:index, :edit]
    resources :orders
    get 'cart_items/index'
    resources :customers, only: [:show, :quit]
    get 'items' => 'public/items#index'
    get 'items/show'
    root :to => 'homes#top'
    get 'homes/about'
  end
  
  namespace :admin do
    get 'orders/show'
    resources :customers, only: [:index, :show, :edit, :update]
    resources :genres,    only: [:index, :create, :edit, :update]
    root :to => 'homes#top'
    get 'items' => 'admin/items#index'
    resources :items,     only:[:index, :new, :create, :show, :edit, :update]
  end
  
#会員用
  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

#管理者用
    devise_for :admin,skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }
  
     # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
