Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root "movies#index"

  get 'movies', to: 'movies#index'
  get 'movies/:id', to: 'movies#show', as: "movie"
  get "movies/:id/edit", to: "movies#edit", as: "movie_edit"
  patch "movies/:id", to: "movies#update"
end
