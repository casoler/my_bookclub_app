class RenamePastBooksToSelectedBooks < ActiveRecord::Migration[5.0]
  def change
    rename_table :past_books, :selected_books

    rename_column :selected_books, :book_id, :google_book_id
    change_column :selected_books, :google_book_id, :string
  end
end
