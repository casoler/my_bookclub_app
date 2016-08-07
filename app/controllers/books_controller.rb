class BooksController < ApplicationController
  def index
    p params
    @group_id = params[:group_id] if params[:group]
    @books = Book.all
  end
end
