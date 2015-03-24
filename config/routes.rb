PostitTemplate::Application.routes.draw do
  root to: 'posts#index'
    	
  resources :users
  resources :comments
  resources :posts, except: [:destroy]
end
