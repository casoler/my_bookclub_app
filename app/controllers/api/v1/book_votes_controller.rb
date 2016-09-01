class Api::V1::BookVotesController < ApplicationController

  def index
  end

  def create
    binding.pry
    @user = Member.find_by(id: params[:member_id])
    @group = @member.group

    @book_vote = BookVote.new(
      member_id: @member.id,
      google_book_id: params[:google_book_id]
    )

    if @book_vote.save
      flash[:notice] = 'Vote saved'
      redirect_to '/groups/@group.id/book_suggestions'
    else
      render json: { errors: @book_vote.errors.full_messages }, status: 422
    end
  end
end
