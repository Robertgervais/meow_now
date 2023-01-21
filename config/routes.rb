Rails.application.routes.draw do
  root "ballots#index"
  devise_for :users
  resources :users
  resources :ballots
  resources :roles
  resources :user_roles
  post "support/:id", to: "ballots#add_support", as: :support
  get "send_reminder", to: "ballots#send_reminder", as: :send_reminder
  get "pending_index", to: "ballots#pending_index", as: :pending_index
  get "committee", to: "roles#committee", as: :committee
  get "close", to: "ballots#close", as: :close
  get "awaiting_confirmation", to: "users#awaiting_confirmation"
  get "pending/:id", to: "ballots#pending", as: :pending
  get "remove_roles/:id", to: "user_roles#remove_roles", as: :remove_roles

  # delete "logout", to: "sessions#destroy"

end
