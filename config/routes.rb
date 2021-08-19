Rails.application.routes.draw do

  # devise_for :admins
  # devise_for :customers
  scope module: :public do
  get "customers/edit" => "customers#edit"
  get "customers/my_page" => "customers#show"
  patch "customers/my_page" => "customers#update"
  end

  devise_for :admin, :controllers => {
    :sessions => "admin/sessions"
  }

  devise_scope :admin do
    get "admin/sign_in", :to => "admin/sessions#new"
    post "admin/sign_in", :to => "admin/sessions#create"
  end

  devise_for :customers,controllers:{
    registrations: "public/registrations",
    sessions: "public/sessions"
  }

  devise_scope :customers do
    get "customers/sign_up", :to => "public/registrations#new"
    post "customers", :to => "public/registrations#create"

    get "customers/sign_in", :to => "public/sessions#new"
    post "customers/sign_in", :to => "public/sessions#create"
    delete "customers/sign_out", :to => "public/sessions#destroy"

  end

  scope module: :public do
    root to: "homes#top"
    get "about" => "homes#about"
    get "/search", to: "searches#search"
    resources :items,only:[:index,:show]
    resource :customers,only:[:edit,:update]
    resources :cart_items,only:[:index,:update,:destroy,:create]
    resources :orders,only:[:show,:create,:index,:new]
    resources :addresses,except:[:new,:show]
    get "customers/unsubscribe" => "customers#unsubscribe"
    patch "customers/withdraw" => "customers#withdraw"
    delete "cart_items/destroy_all" => "cart_items#destroy_all"
    post "orders/confirm" => "orders#confirm"
    get "orders/complete" => "orders#complete"

  end

  namespace :admin do
    root to: "homes#top"
    get "/search", to: "searches#search"
    resources :items,except:[:destroy]
    resources :genres,only:[:index,:create,:edit,:update]
    resources :customers,only:[:index,:show,:edit,:update]
    resources :orders,only:[:show,:update] do
      resources :order_details,only:[:update]
    end
  end

end
