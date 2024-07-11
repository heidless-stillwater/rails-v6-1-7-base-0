Rails.application.routes.draw do
  resources :images
#  devise_for :users, :controllers => { :registrations => 'registrations' }
  devise_for :users
  root 'welcome#index' 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

# Rails.application.routes.draw do
#   root 'welcome#index'
#   get 'home/index'
#   devise_for :users
#   # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
# end

