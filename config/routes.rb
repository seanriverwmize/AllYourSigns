Rails.application.routes.draw do
  resources :subjects
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#about'
  get 'about', to: 'welcome#about', as: 'about'
end
