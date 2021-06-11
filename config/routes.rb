Rails.application.routes.draw do
  post 'user_token'   => 'user_token#create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get '/users'        => 'users#index'
  get '/users/:id'    => 'users#show'
  post '/users'       => 'users#create'
  post '/task'        => 'tasks#create'
  post '/groups'      => 'groups#create'
end
