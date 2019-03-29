Rails.application.routes.draw do
	root "discuss_groups#index"

	resources :discuss_groups
end
