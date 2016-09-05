Rails.application.routes.draw do
  get '/groups/:group_id/book_suggestions'     => 'book_suggestions#index'
  get '/groups/:group_id/book_suggestions/new' => 'book_suggestions#new'
  post '/groups/:group_id/book_suggestions'    => 'book_suggestions#create'

  get '/groups'               => 'groups#index'
  get '/groups/new'           => 'groups#new'
  post '/groups'              => 'groups#create'
  post '/groups/:id/add_member' => 'groups#add_member'
  get '/groups/:group_id/books' => 'books#index'
  get '/groups/:id'           => 'groups#show'

  namespace :api do
    namespace :v1 do
      get '/book_votes' => 'book_votes#index'
      post '/book_votes' => 'book_votes#create'
      delete '/book_votes' => 'book_votes#destroy'
    end
  end

  get '/books'                => 'books#index'

  get '/signup'               => 'users#new'
  post '/users'               => 'users#create'
  get '/users/:id'            => 'users#show'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/login'                => 'sessions#new'
  post '/login'               => 'sessions#create'
  get '/logout'               => 'sessions#destroy'
end
