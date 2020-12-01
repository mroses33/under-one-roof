Rails.application.routes.draw do
  # get 'users/show'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :experiences do
    resources :experience_categories, only: [:new, :create]
    resources :items, except: :show
    resources :bookings, only: [:new, :create] do
      member do
        patch :accept
        patch :reject
        get :pay
      end
    end
    resources :instances
  end

  resources :bookings, only: [:destroy, :show, :edit, :update] do
    resources :reviews, only: [:create, :new]
  end

  resources :reviews, only: [:destroy]
  resources :users, only: [:show, :edit, :update]
end



