Rails.application.routes.draw do
  
  resources :charges, only: [:new, :create]

  resources :collaborators, only: [:destroy]
  
  post 'collaborators/create', :as => :create_collaborator

  devise_for :users
  
  resources :wikis do
    resources :collaborators, only: [:create]  
  end

  get 'welcome/index', :as => :home

  get 'welcome/about'
  
  get 'charges/cancel', :as => :cancel_charge
  
  post 'charges/downgrade', :as => :downgrade_charge
  
  root 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
