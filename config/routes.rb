Rails.application.routes.draw do

  root to: 'homes#top'
  get 'home/about' => 'homes#about'

  devise_for :public,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  devise_for :admin,skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }


  namespace :admin do
    resources :items, except: [:destroy]
    resources :publics, except: [:new, :create, :destroy]
    resources :orders, only: [:index, :show, :update]
  end

  namespace :public do
    resources :address, except: [:new, :show]
    resources :carts, except: [:new, :show, :edit]
    resources :items, only: [:index, :show]
    resources :orders, except: [:edit, :update, :destroy]
    get 'orders/check' => 'orders#check'
    get 'orders/success' => 'orders/success'
    resources :publics, only: [:show, :edit, :update]
    get 'users/erasure' => 'users#erasure'
    delete 'users/:id' => 'users#leave'
  end

  end
