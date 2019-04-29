Rails.application.routes.draw do
  root "ballots#index"
  devise_for :users
  resources :users
  resources :ballots
  post "support/:id", to: "ballots#add_support", as: :support
  get "send_reminder", to: "ballots#send_reminder", as: :send_reminder
  get "pending_index", to: "ballots#pending_index", as: :pending_index
  get "committee", to: "users#committee", as: :committee
  get "close", to: "ballots#close", as: :close
  require "sidekiq/web"
  mount Sidekiq::Web => "/sidekiq"

  # root "ballots#index"
  # resources :users
  # resources :ballots do
  #   resources :votes
  # end

  # get "pending/:id", to: "ballots#pending", as: :pending
  # delete "logout", to: "sessions#destroy"

  # get "awaiting_confirmation", to: "users#awaiting_confirmation"

end
