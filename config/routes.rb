Rails.application.routes.draw do
  resources :super_fans, only: [:index, :destroy]
  resources :reviews, only: :create
  resources :songs, only: [:index, :show]

  get '/song/top_charts', to: "songs#top_charts"


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
