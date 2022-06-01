Rails.application.routes.draw do

  
  
  namespace :public do
    get 'cart_items/index'
    get 'cart_items/update'
    get 'cart_items/destroy'
    get 'cart_items/destroy_all'
    get 'cart_items/create'
  end
  
  namespace :public do
    #Homes
    get '/' => "homes#top"
    get 'about' => "homes#about"
    #Items
    resources :items, only: [:index, :show]
    #Registration
    resources :registrations, only: [:new, :create]
    #Sessions
    resources :sessions, only: [:new, :create, :destroy]
    #Customers
    get "customers/home" => "customers#show"
    get "customers/edit" => "customers#edit"
    patch "customers" => "customers#update"
    get "customers/confirmation" => "customers#confirmation"
    patch "customers/confirmation" => "customers#withdraw"
    #Cart_Items
    get "cart_items" => "cart_items#index"
    patch "cart_items/:id" => "cart_items#update"
    delete "cart_items/:id/destroy" => "cart_items#destroy"
    delete "cart_items/destroy_all" => "cart_items#destroy_all"
    #Orders
    
  end

  namespace :admin do

  end

  # 顧客用
  # URL /customers/sign_in ...
  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin,skip: [:registrations,:passwords], controllers: {
    sessions: "admin/sessions"
  }

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
