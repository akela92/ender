Rails.application.routes.draw do

#Definir named routes
  root                'static_pages#home'
  get    'help'    => 'static_pages#help'
  get    'about'   => 'static_pages#about'
  get    'signup'  => 'users#new'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  get 'loading' => 'escenarios#new'
  get 'contact', to: 'messages#new', as: 'contacto'
  post 'contact', to: 'messages#create'
  get 'comprobar' => 'escenarios#comprobar'
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
  resources :microposts,          only: [:create, :destroy]
  resources :relationships,       only: [:create, :destroy]  
  resources :escenarios
  resources :escenario_ideals
end
