Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'users#new'
  resources :users, except: [:new]
  resources :rooms
  resources :booking
  # get 'users/index', to: 'users#index'
  # get 'users/:id/edit', to: 'users#edit'
  # get 'users/:id', to: 'users#show'
end
