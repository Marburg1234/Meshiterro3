Rails.application.routes.draw do


  devise_for :users
  root to: 'homes#top'
  get 'homes/about' => 'homes#about', as: 'about'

  resources :post_images, only: [:new, :create, :index, :show, :destroy] do
    resource :favorite, only: [:create, :destroy]
    resources :post_comments, only: [:create, :destroy]
  end


  resources :users, only: [:edit, :show, :update]

  resource :map, only: [:show] # 追記
end
