Rails.application.routes.draw do
  devise_for :users
	root "discuss_groups#index"

	resources :discuss_groups do
		resources :posts
	end
end
