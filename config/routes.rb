Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"

  resources :users, only: [:index, :new, :show, :destroy]
  resources :items, only: [:index, :new, :create, :show, :edit, :update]
  # resources :items 
  # (削除機能追加時に６行目と７行目を入れ替える)

end