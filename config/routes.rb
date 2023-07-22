Rails.application.routes.draw do
  # 顧客用
devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

# 管理者用
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
   namespace :admin do
    root to: "homes#top"
    get "about", to: "homes#about"
    resources :items, except: [:destroy]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :orders
    resources :order_details
   end

   scope module: :public do
    root to: "homes#top"
    get "about", to: "homes#about"
    resources :items, only: [:index, :show]
    resources :customers, only: [:edit,:update,:show] do
      collection do
        # 退会確認画面
        get  '/customers/check' => 'customers#check'
        # 論理削除用のルーティング
        patch  '/customers/withdraw' => 'customers#withdraw'
      end
    end
    resources :cart_items,only: [:index,:update,:create,:destroy] do
      collection do
        delete '/all_destroy' => 'cart_items#all_destroy'
      end
    end
    resources :orders, only: [:new, :create, :index, :show]do
      collection do
        post "confirm"
        get "complete"
      end
    end
    resources :addresses
    end
   end
