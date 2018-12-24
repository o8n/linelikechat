Rails.application.routes.draw do
  get 'users/index'
  devise_for :users, controllers: {confirmation: 'confirmation', omniauth_callbacks: 'users/omniauth_backs', registations: 'registrations'}#sessions: 'users/sessions'
  resources :users, :only => [:index]
  root 'pages#index'
  get 'pages/show'
  root to: 'rooms#show'
  #deviseのルーティング指定はこれでいいのか？
  get 'rooms/show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  mount ActionCable.server => '/cable'
end
