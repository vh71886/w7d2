Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: redirect('/bands')

#      Prefix Verb   URI Pattern                                                                              Controller#Action
#        root GET    /                                                                                        redirect(301, /bands)
# new_session GET    /session/new(.:format)                                                                   sessions#new
#     session DELETE /session(.:format)                                                                       sessions#destroy
#             POST   /session(.:format)                                                                       sessions#create
#       users POST   /users(.:format)                                                                         users#create
#    new_user GET    /users/new(.:format)                                                                     users#new
#        user GET    /users/:id(.:format)                                                                     users#show
  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :show]

#      Prefix Verb   URI Pattern                                                                              Controller#Action
#       bands GET    /bands(.:format)                                                                         bands#index
#             POST   /bands(.:format)                                                                         bands#create
#    new_band GET    /bands/new(.:format)                                                                     bands#new
#   edit_band GET    /bands/:id/edit(.:format)                                                                bands#edit
#        band GET    /bands/:id(.:format)                                                                     bands#show
#             PATCH  /bands/:id(.:format)                                                                     bands#update
#             PUT    /bands/:id(.:format)                                                                     bands#update
#             DELETE /bands/:id(.:format)                                                                     bands#destroy
  resources :bands do
    resources :albums, only: [:new]
  end

  #         Prefix Verb   URI Pattern                                                                         Controller#Action
  # new_band_album GET    /bands/:band_id/albums/new(.:format)                                                albums#new
  #         albums POST   /albums(.:format)                                                                   albums#create
  #     edit_album GET    /albums/:id/edit(.:format)                                                          albums#edit
  #          album GET    /albums/:id(.:format)                                                               albums#show
  #                PATCH  /albums/:id(.:format)                                                               albums#update
  #                PUT    /albums/:id(.:format)                                                               albums#update
  #                DELETE /albums/:id(.:format)                                                               albums#destroy
  resources :albums, only: [:create, :edit, :show, :update, :destroy] do
    resources :tracks, only: [:new]
  end

  #          Prefix Verb   URI Pattern                                                                        Controller#Action
  # new_album_track GET    /albums/:album_id/tracks/new(.:format)                                             tracks#new
  #          tracks POST   /tracks(.:format)                                                                  tracks#create
  #      edit_track GET    /tracks/:id/edit(.:format)                                                         tracks#edit
  #           track GET    /tracks/:id(.:format)                                                              tracks#show
  #                 PATCH  /tracks/:id(.:format)                                                              tracks#update
  #                 PUT    /tracks/:id(.:format)                                                              tracks#update
  #                 DELETE /tracks/:id(.:format)                                                              tracks#destroy
  resources :tracks, only: [:create, :edit, :show, :update, :destroy]

end
