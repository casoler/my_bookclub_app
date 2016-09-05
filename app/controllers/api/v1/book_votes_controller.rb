class Api::V1::BookVotesController < ApplicationController

  def index
    @book_votes = BookVote.where(group_id: params[:group_id]).group(:google_book_id).count

    @books = []
    @book_votes.each do |google_book_id, count|
      book = {}
      google_book = GoogleBooks.search(google_book_id).first
      book[:title] = google_book.title
      book[:author] = google_book.authors
      book[:votes] = count
      @books << book
    end
  end

  def create
    @member = Member.find_by(id: params[:member_id])
    # @group = @member.group

    @book_vote = BookVote.find_by(member_id: @member.id, google_book_id: params[:google_book_id])

    if @book_vote.nil?
      @book_vote = BookVote.new(
        member_id: @member.id,
        group_id: @member.group.id,
        google_book_id: params[:google_book_id]
      )

      if @book_vote.save
        flash[:notice] = 'Vote added'
        redirect_to "/groups/#{@member.group.id}/book_suggestions"
      else
        render json: { errors: @book_vote.errors.full_messages }, status: 422
      end
    else
      @book_vote.destroy
      flash[:notice] = 'Vote removed'
      redirect_to "/groups/#{@member.group.id}/book_suggestions"
    end
  end
end
