Rails.application.routes.draw do
  # get 'users/show'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :experiences do
    resources :bookings, only: [:new, :create, :show, :edit, :update] do
      member do
        patch :accept
        patch :reject
      end
    end
  end

  resources :bookings, only: [:destroy]

  resources :users, only: [:show]
end



