Rails.application.routes.draw do

#会員用のルーティング設定
  get 'items' => 'public/items#index'
#管理者用のルーティング設定
namespace :admin do
    get 'items' => 'admin/items#index'
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
