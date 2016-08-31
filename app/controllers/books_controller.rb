class BooksController < ApplicationController
  def index
    @books = GoogleBooks.search('subject:science+fiction -juvenile -comics -graphics', count: 10)
    @group_id = params[:group_id]
  end

end
