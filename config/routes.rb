Rails.application.routes.draw do
  devise_for :users
  root to: "homes#top"
  get 'homes/about' => 'homes#about', as: 'about'
  resources :books, only: [:create, :edit, :index, :show, :destroy, :update]
  resources :users, only: [:edit, :index, :show, :destroy, :update]
end
