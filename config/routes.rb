Rails.application.routes.draw do
  
  root 'songs#index'

  get    'signup'  => 'users#new'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  # delete 'logout'  => 'sessions#destroy'
  get   'logout' => 'sessions#destroy'
  get    'verify'  => 'sessions#verify_access_token'
  
  get 'play'  => 'songs#play'
  get 'stop'  => 'songs#stop'


  resources :users
  resources :artists
  resources :password_resets, only: [:new, :create, :edit, :update]

  namespace :api do 
    namespace :v1 do
      
      post   'login'   => 'sessions#create'
      delete 'logout'  => 'sessions#destroy'
      get    'verify'  => 'sessions#verify_access_token'
      resources :users, param: :access_token
      resources :password_resets, only: [:new, :create, :edit, :update]
      resources :songs
    end
  end
  resources :songs 

  resources :listenings

end