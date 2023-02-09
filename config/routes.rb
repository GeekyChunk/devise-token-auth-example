Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  get 'main/me', to: 'main#me'
  put 'main/upme', to: 'main#upme'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
