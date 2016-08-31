Rails.application.routes.draw do
  get '/book_suggestions'     => 'book_suggestions#index'
  get '/book_suggestions/new' => 'book_suggestions#new'
  post '/book_suggestions'    => 'book_suggestions#create'

  get '/groups'               => 'groups#index'
  get '/groups/new'           => 'groups#new'
  post '/groups'              => 'groups#create'
  post '/groups/:id/add_member' => 'groups#add_member'
  get '/groups/:group_id/books' => 'books#index'
  get '/groups/:id'           => 'groups#show'

  get '/books'                => 'books#index'

  get '/signup'               => 'users#new'
  post '/users'               => 'users#create'
  get '/users/:id'            => 'users#show'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/login'                => 'sessions#new'
  post '/login'               => 'sessions#create'
  get '/logout'               => 'sessions#destroy'
end
