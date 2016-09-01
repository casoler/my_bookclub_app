class BooksController < ApplicationController
  def index
    @books = GoogleBooks.search('subject:science+fiction -juvenile -comics -graphics', count: 10, api_key: 'AIzaSyCNwQz636DLk3IXl_5Yc37RDdtYo0iIg7M', country: "us")
    @group_id = params[:group_id]
  end

end
