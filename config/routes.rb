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
    resources :order_details, only: [:update]
  end
    
   scope module: :public do
    root to: 'homes#top'
    resources :addresses, except: [:new, :show]
    resources :cart_items, except: [:new, :show, :edit] do
      collection do
        delete 'destroy_all'
      end
    end
    resources :items, only: [:index, :show]
    resources :orders, except: [:edit, :update, :destroy]
    get 'orders/check' => 'orders#check'
    get 'orders/success' => 'orders/success'
    resources :customers, only: [:show, :edit,:update] do
    member do get :erasure
    end end
    delete 'customers/:id' => 'customers#leave'
  end
end
