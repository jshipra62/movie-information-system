Rails.application.routes.draw do
  resources :languages
  resources :reviews
  resources :books
  resources :shows
  resources :theaters
  resources :movies
  resources :users

  get  '/movie/home',     to: 'movies#home', as: :home_movie
  get  '/movie/booking',     to: 'movies#booking', as: :booking_movie
  get  '/movie/ratings',     to: 'movies#ratings', as: :ratings_movie

  get '/admovies'     => 'movies#index1'
  get '/userbooks'     => 'books#index1'
  get '/userreviews'     => 'reviews#index1'
  get '/about'     => 'welcome#about'
  get '/contact'     => 'welcome#contact'
  

  get '/login'     => 'sessions#new'	
  post '/login'    => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  root 'movies#home'

end
