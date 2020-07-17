Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to:'toppages#index'
  
  get 'login',  to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout',  to: 'sessions#destroy'
  
  get 'signup', to:'users#new'
  resources :users, only: [:index, :show, :new, :create] do
    member do
      get :joined_teams
    end
  end
  resources :teams, only: [:index, :show, :create, :edit, :update, :destroy] do
    member do
      get :members
    end
  end
  resources :tasks, only: [:show, :create, :edit, :update,]
  resources :relationships, only: [:create, :destroy]
end
