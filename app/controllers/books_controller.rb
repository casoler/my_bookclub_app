class BooksController < ApplicationController
  def index
    @books = GoogleBooks.search('subject:#{genre.genre} +fiction -juvenile -comics -graphics', count: 10, api_key: 'AIzaSyCNwQz636DLk3IXl_5Yc37RDdtYo0iIg7M', country: "us")
    @member = Member.find_by(id: params[:member_id])
  end

end
