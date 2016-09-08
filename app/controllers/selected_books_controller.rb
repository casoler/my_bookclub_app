class SelectedBooksController < ApplicationController
  def create
    next_month = Time.now + 1.month

    @selected_book = SelectedBook.find_by(group_id: params[:group_id], month: next_month.month, year: next_month.year)

    if @selected_book
      @selected_book.google_book_id = params[:google_book_id]
    else
      @selected_book = SelectedBook.new(
        group_id: params[:group_id],
        google_book_id: params[:google_book_id],
        month: next_month.month,
        year: next_month.year
      )
    end

    if @selected_book.save
      flash[:notice] = 'book saved'
      redirect_to "/groups/#{params[:group_id]}"
    else
      flash[:error] = 'oops, try again'
      redirect_to book_votes_path(group_id: params[:group_id])
    end

  end
end
