Rails.application.routes.draw do
  # get 'users/show'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :experiences do
    resources :items, except: :show
    resources :bookings, only: [:new, :create] do
      member do
        patch :accept
        patch :reject
      end
    end
  end

  resources :bookings, only: [:destroy, :show, :edit, :update]
  resources :users, only: [:show]
end



