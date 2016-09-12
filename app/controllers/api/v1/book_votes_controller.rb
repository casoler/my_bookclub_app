class Api::V1::BookVotesController < ApplicationController

  

  def create
    @member = Member.find_by(id: params[:member_id])
    # @group = @member.group

    @book_vote = BookVote.find_by(member_id: @member.id, isbn: params[:isbn])

    if @book_vote.nil?
      @book_vote = BookVote.new(
        member_id: @member.id,
        group_id: @member.group.id,
        isbn: params[:isbn]
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
