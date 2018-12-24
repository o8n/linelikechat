Rails.application.routes.draw do
  devise_for :users, controllers: {sessions: 'users/sessions', registrations: 'users/registrations', passwords: 'users/passwords', omniauth_callbacks: 'users/omniauth_callbacks'}
  resources :users, :only ['index', 'show']
  root 'pages#index'
  get 'pages/show'
  root to: 'rooms#show'
  #deviseのルーティング指定はこれでいいのか？
  get 'rooms/show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  mount ActionCable.server => '/cable'
end
