Rails.application.routes.draw do


  get '/groups/:group_id/book_suggestions'     => 'book_suggestions#index'
  get '/groups/:group_id/book_suggestions/new' => 'book_suggestions#new'
  post '/groups/:group_id/book_suggestions'    => 'book_suggestions#create'

  get '/groups'               => 'groups#index'
  get '/groups/new'           => 'groups#new'
  post '/groups'              => 'groups#create'
  get '/groups/:id'           => 'groups#show'
  get '/groups/:id/edit'      => 'groups#edit'
  patch '/groups/:id'         => 'groups#update'

  post '/groups/:id/add_member'  => 'groups#add_member'
  get '/groups/:group_id/books'  => 'books#index'

  get '/meetings/new'         => 'meetings#new'
  post '/meetings'            => 'meetings#create'
  get '/meetings/:id/edit'    => 'meetings#edit'
  patch '/meetings/:id'       => 'meetings#update'

  namespace :api do
    namespace :v1 do
      # get '/book_votes' => 'book_votes#index'
      post '/book_votes' => 'book_votes#create'
      delete '/book_votes' => 'book_votes#destroy'
    end
  end

  get '/books'                => 'books#index'
  get '/books/:id'            => 'books#show'
  get '/books/nytimes/:id'    => 'books#nytimes'
  get '/books/idreambooks/:id' => 'books#idreambooks'

  post '/selected_books'      => 'selected_books#create'
  get '/book_votes'           => 'book_votes#index'

  get '/signup'               => 'users#new'
  post '/users'               => 'users#create'
  get '/users/:id'            => 'users#show'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/login'                => 'sessions#new'
  post '/login'               => 'sessions#create'
  get '/logout'               => 'sessions#destroy'

  get '/'                     => 'sessions#new'
end
