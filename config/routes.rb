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
    resources :genres, only: [:index, :create, :edit, :update]
  end

   scope module: :public do
    root to: 'homes#top'
    get '/about' => 'homes#about'
    resources :addresses, except: [:new, :show]
    resources :cart_items, except: [:new, :show, :edit] do
      collection do
        delete 'destroy_all'
      end
    end
    resources :items, only: [:index, :show]
    post 'orders/check' => 'orders#check'
    get 'orders/success' => 'orders/success'
    resources :orders, except: [:edit, :update, :destroy]
    resources :customers, only: [:show, :edit,:update] do
    member do get :erasure
    end end
    delete 'customers/:id' => 'customers#leave'
  end
end
