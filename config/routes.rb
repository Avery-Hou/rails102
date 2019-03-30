Rails.application.routes.draw do
  devise_for :users
	root "discuss_groups#index"

	resources :discuss_groups do
		resources :posts
		post :join, on: :member
		post :quit, on: :member
	end
end
