Rails.application.routes.draw do
  root 'dashboard#index'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, 
  controllers: { 
  	sessions: 'users/sessions',
  	confirmations: 'users/confirmations',
  	registrations: 'users/registrations',
  	unlocks: 'users/unlocks',
  	passwords: 'users/passwords'
  },
  path: 'auth', 
  path_names: { 
  	sign_in: 'login', 
  	sign_out: 'logout', 
  	password: 'secret', 
  	confirmation: 'verification', 
  	unlock: 'unblock', 
  	registration: 'register', 
  	sign_up: 'cmon_let_me_in' 
  }
end
