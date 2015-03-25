PostitTemplate::Application.routes.draw do
  root to: 'posts#index'
    	
  resources :users
  resources :categories
  resources :posts, except: [:destroy]
end
