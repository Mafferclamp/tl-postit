PostitTemplate::Application.routes.draw do
  root to: 'posts#index'
    	
  resources :users
  resources :posts, except: [:destroy] do
  	resources :comments, only: [:create, :show]
  end
end
