Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'surveys#index'

  post '/surveys/:id/submit' => 'surveys#submit'
  get '/surveys/results' => 'surveys#results'
  resources :surveys


end
