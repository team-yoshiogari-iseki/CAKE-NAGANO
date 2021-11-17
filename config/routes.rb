Rails.application.routes.draw do



  devise_for :customer,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  devise_for :admin,skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }


  namespace :admin do
    root to: 'homes#top'
    resources :items, except: [:destroy]
    resources :customers, except: [:new, :create, :destroy]
    resources :orders, only: [:show, :update]
  end

  scope module: :public do
    resources :addresses, except: [:new, :show]
    resources :cart_items, except: [:new, :show, :edit]
    resources :items, only: [:index, :show]
    resources :orders, except: [:edit, :update, :destroy]
    get 'orders/check' => 'orders#check'
    get 'orders/success' => 'orders/success'
    resources :customers, only: [:show, :edit, :update]
    get 'customers/erasure' => 'customers#erasure'
    delete 'customers/:id' => 'customers#leave'
  end
end
