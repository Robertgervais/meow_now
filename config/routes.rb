Rails.application.routes.draw do
  devise_for :users
  require "sidekiq/web"
  mount Sidekiq::Web => "/sidekiq"

  root "ballots#index"
  resources :users
  resources :ballots do
    resources :votes
  end

  get "committee", to: "users#committee", as: :committee
  get "pending_index", to: "ballots#pending_index", as: :pending_index
  get "pending/:id", to: "ballots#pending", as: :pending
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"
  post "support/:id", to: "ballots#add_support", as: :support
  get "awaiting_confirmation", to: "users#awaiting_confirmation"
  get "send_reminder", to: "ballots#send_reminder", as: :send_reminder
  get "close", to: "ballots#close", as: :close
end
