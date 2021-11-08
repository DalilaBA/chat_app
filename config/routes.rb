Rails.application.routes.draw do

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'chatroom#index'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  post 'message', to:'messages#create'
  get 'signup', to: 'users#new'
  get 'avatar', to: 'users#avatar'
  get 'add_avatar', to: 'users#add_avatar'
  resources :users, except: [:new]
  mount ActionCable.server, at: '/cable' #communication via that route will be possible in my app
end
