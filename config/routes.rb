Rails.application.routes.draw do
	root 'ballots#index'
	resources :users
	resources :ballots do
		resources :votes
	end
	get 'pending/:id', to: 'ballots#pending', as: :pending
	get 'login', to: 'sessions#new'
	post 'login', to: 'sessions#create'
	delete 'logout', to: 'sessions#destroy'
	post 'support/:id', to: 'ballots#add_support', as: :support
	get 'change_password/:id', to: 'users#change_password', as: :change_password
	patch 'change_password/:id', to: 'users#change_password', as: :update_password
end
