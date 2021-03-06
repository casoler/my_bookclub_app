class BookSuggestionsController < ApplicationController
  def index
    @group = Group.find_by(id: params[:group_id])
    @book_suggestions = @group.book_suggestions
    @member = Member.find_by(group_id: @group.id, user_id: current_user.id)
  end

  def new
  end

  def create
    @group_id = params[:group_id]

    params[:book_suggestions].each do |suggestion|  
      suggested_book = BookSuggestion.find_by(group_id: @group_id, isbn: suggestion)

      if suggested_book.nil?
        book = GoogleBooks.search(suggestion).first
        book_suggestion = BookSuggestion.new(
          isbn: suggestion,
          group_id: @group_id,
          title: book.title,
          author: book.authors,
          image_url: book.image_link,
          description: book.description
        )

        unless book_suggestion.save
          flash[:error] = 'oops'
          render '/book_suggestions' and return
        end
      end
    end
    # flash[:success] = 'hurray'
    redirect_to "/groups/#{@group_id}/book_suggestions"
  end
end
