Rails.application.routes.draw do
  # get 'users/show'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :experiences do
    resources :experience_categories, only: [:new, :create]

    resources :items, except: [:destroy, :show]
    resources :favorites, only: [:create, :destroy]
    resources :bookings, only: [:new, :create] do
      member do
        patch :accept
        patch :reject
        get :pay
        get :success
      end
    end
    resources :instances
  end

  resources :bookings, only: [:destroy, :show, :edit, :update] do
    resources :reviews, only: [:create, :new]
    resources :guest_bookings, only: [:create, :new]
  end

  resources :reviews, only: [:destroy]
  resources :users, only: [:show, :edit, :update]

  resources :items, only: [:destroy]

end





