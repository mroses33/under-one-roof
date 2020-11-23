Rails.application.routes.draw do
  get 'bookings/new'
  get 'bookings/create'
  get 'bookings/show'
  get 'bookings/edit'
  get 'bookings/update'
  get 'bookings/destroy'
  get 'experiences/index'
  get 'experiences/show'
  get 'experiences/new'
  get 'experiences/create'
  get 'experiences/edit'
  get 'experiences/update'
  get 'experiences/destroy'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :experiences do
    resources :bookings, only: [:new, :create, :show, :edit, :update]
  end

  resources :bookings, only: [:destroy]
end
