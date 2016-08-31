class BookSuggestionsController < ApplicationController
  def index
    @book_suggestions = BookSuggestion.where(group_id: params[:group_id])
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
    redirect_to book_suggestions_path(group_id: @group_id)
  end
end
