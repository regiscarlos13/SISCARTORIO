Rails.application.routes.draw do
  
  resources :laws
  resources :natures
  resources :seizures
  resources :bocs
  resources :tcos
  resources :bos
  namespace :relatorios do
    get 'livros/inqueries'
    get 'livros/precatories'
    get 'livros/seizures'
  end
  resources :precatories
  resources :servers
  resources :joins
  resources :inqueries do
    resources :involveds
  end
  get 'welcome/index'
  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users, :skip => [:registrations]
  #devise_for :users
  resources :people
  resources :registries
  resources :users
end
