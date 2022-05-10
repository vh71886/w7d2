Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  # Prefix Verb   URI Pattern                                                                            Controller#Action
  # new_session GET    /session/new(.:format)                                                             sessions#new
  #     session DELETE /session(.:format)                                                                 sessions#destroy
  #             POST   /session(.:format)                                                                 sessions#create
  #       users POST   /users(.:format)                                                                   users#create
  #    new_user GET    /users/new(.:format)                                                               users#new
  #        user GET    /users/:id(.:format)                                                               users#show
  #       bands GET    /bands(.:format)                                                                   bands#index
  #             POST   /bands(.:format)                                                                   bands#create
  #    new_band GET    /bands/new(.:format)                                                               bands#new
  #   edit_band GET    /bands/:id/edit(.:format)                                                          bands#edit
  #        band GET    /bands/:id(.:format)                                                               bands#show
  #             PATCH  /bands/:id(.:format)                                                               bands#update
  #             PUT    /bands/:id(.:format)                                                               bands#update
  #             DELETE /bands/:id(.:format)                                                               bands#destroy
  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :show]
  resources :bands

  root to: redirect('/bands')
end
