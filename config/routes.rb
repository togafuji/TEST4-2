Rails.application.routes.draw do
  
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get 'server/index'
  # Defines the root path route ("/")
  # root "articles#index"
  # resources:server
  root to:"server#index"
  resources :users
  
   get 'new' => "books/new"
   get 'books/index'
   resources :books
    get 'books/show'
   
  resources :books, only: [:index,:new,:show,:create] do
    collection do
      get 'search'
      post 'search'
    end
  end

 resources :books do
    resources :reservations do
    collection do
    post 'confirm' 
    end
  end
    
 end 

    # get 'books/new'
  # resources :users, only: [:show]
  # devise_for :users, controllers: {
  #   registrations: 'users/registrations'
  # }
end
