Rails.application.routes.draw do


  get 'users/edit'
  get 'users/show'
  devise_for :users
  root to: 'homes#top'
  get 'homes/about' => 'homes#about', as: 'about'

  resources :post_images, only: [:new, :create, :index, :show, :destroy]


end
