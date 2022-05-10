Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  # Prefix Verb   URI Pattern                                                                              Controller#Action
  # new_session GET    /session/new(.:format)                                                              sessions#new
  #     session DELETE /session(.:format)                                                                  sessions#destroy
  #             POST   /session(.:format)                                                                  sessions#create
  #       users POST   /users(.:format)                                                                    users#create
  #    new_user GET    /users/new(.:format)                                                                users#new
  #        user GET    /users/:id(.:format)                                                                users#show
  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :show]

  root to: redirect('/session/new')
end
