Rails.application.routes.draw do
  devise_for :users, controllers: {sessions: 'users/sessions'}
  root 'pages#index'
  get 'pages/show'
  root to: 'rooms#show'
  #deviseのルーティング指定はこれでいいのか？
  get 'rooms/show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  mount ActionCable.server => '/cable'
end
