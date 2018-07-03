Rails.application.routes.draw do
	root 'ballots#index'
	resources :users
	resources :ballots do
		resources :votes
	end
	get 'login', to: 'sessions#new'
	post 'login', to: 'sessions#create'
	delete 'logout', to: 'sessions#destroy'
	get 'pending', to: 'ballots#pending'
end
