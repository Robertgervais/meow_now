Rails.application.routes.draw do

	require 'sidekiq/web'
	mount Sidekiq::Web => "/sidekiq"

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
	get 'awaiting_confirmation', to: "users#awaiting_confirmation"
end
