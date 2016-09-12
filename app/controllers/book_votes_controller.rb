class BookVotesController < ApplicationController
  def index
    @group = Group.find_by(id: params[:group_id])
    @book_votes = BookVote.where(group_id: @group.id).group(:isbn).count

    @books = []
    @book_votes.each do |isbn, count|
      book = {}
      suggested_book = BookSuggestion.find_by(isbn: isbn)
      book[:isbn] = isbn
      book[:title] = suggested_book.title
      book[:author] = suggested_book.author
      book[:votes] = count
      @books << book
    end
  end
end
