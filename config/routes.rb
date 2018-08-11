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
end
