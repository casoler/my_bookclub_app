class BookSuggestionsController < ApplicationController
  def index
    @group = Group.find_by(id: params[:group_id])
    @book_suggestions = @group.book_suggestions
    # @member = 
  end

  def new
  end

  def create
    @group_id = params[:group_id]

    params[:book_suggestions].each do |suggestion|
      book_suggestion = BookSuggestion.new(
        google_book_id: suggestion,
        group_id: @group_id
      )

      unless book_suggestion.save
        flash[:error] = 'oops'
        render '/book_suggestions' and return
      end
    end
    flash[:success] = 'hurray'
    redirect_to "/groups/#{@group_id}/book_suggestions"
  end
end
