Rails.application.routes.draw do

  get '/groups' => 'groups#index'
  get '/groups/new' => 'groups#new'
  post '/groups' => 'groups#create'
  post '/groups/:id/add_member' => 'groups#add_member'
  get '/groups/:group_id/books' => 'books#index'
  post '/groups/:group_id/add_book/:book_id' => 'groups#add_book'
  get '/groups/:id' => 'groups#show'

  

  get '/books' => 'books#index'

  get '/signup' => "users#new"
  post '/users' => "users#create"
  get '/users/:id' => 'users#show'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

end
