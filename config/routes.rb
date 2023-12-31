Rails.application.routes.draw do

      # 顧客用.
    # URL /customers/sign_in ...
    devise_for :customers,skip: [:passwords], controllers: {
      registrations: "public/registrations",
      sessions: 'public/sessions'
    }

    # 管理者用.
    # URL /admin/sign_in ...
    devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
      sessions: "admin/sessions"
    }

    # 顧客用.
     scope module: :public do
      root to: "homes#top"
        get 'about' => 'homes#about'
        get "search" => "searches#search"
        
      resources :items, only: [:index, :show]

        get 'customers/my_page' => 'customers#show'                          #顧客のマイページ.
        get 'customers/information/edit' => 'customers#edit'                 #顧客の登録情報編集画面.
        patch 'customers/information' => 'customers#update'                  #顧客の登録情報更新.
        get 'customers/quit' => 'customers#quit'                             #顧客の退会確認画面.
        patch 'customers/withdraw' => 'customers#withdraw'        #顧客の退会処理(ステータスの更新).
        
      delete 'cart_items/destroy_all' => 'cart_items#destroy_all'          #カート内商品データ削除(全て).
      resources :cart_items, only: [:index,:create, :update, :destroy]
      
      post 'orders/check' => 'orders#check'                                #注文情報確認画面.
      get 'orders/completed' => 'orders#completed'                         #注文完了画面.
      resources :orders, only: [:new, :create, :index, :show]

      resources :shipping_addresses, only: [:index, :edit, :create, :update, :destroy]
    end

    # 管理者用.
      namespace :admin do
        get '/' => "homes#top"

      resources :items, only: [:index, :new, :show, :create, :edit, :update]
      resources :genres, only: [:index, :create, :edit, :update]
      resources :customers, only:  [:index, :show, :edit, :update]
      resources :orders, only: [:show, :update]
      resources :order_details, only: [:update]

     end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
