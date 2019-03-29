Rails.application.routes.draw do
	root "welcome#index"

	resources :discuss_groups
end
