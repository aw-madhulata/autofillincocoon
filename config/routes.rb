Rails.application.routes.draw do
  get 'containers/search/:q' => "containers#search"
  resources :voyages
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "voyages#index"
end
