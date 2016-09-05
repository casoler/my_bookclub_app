class BookVotesController < ApplicationController
  def index
    @group = Group.find_by(id: params[:group_id])
    @book_votes = BookVote.where(group_id: @group.id).group(:google_book_id).count

    @books = []
    @book_votes.each do |google_book_id, count|
      book = {}
      google_book = BookSuggestion.find_by(google_book_id: google_book_id)
      book[:google_book_id] = google_book_id
      book[:title] = google_book.title
      book[:author] = google_book.author
      book[:votes] = count
      @books << book
    end
  end
end
