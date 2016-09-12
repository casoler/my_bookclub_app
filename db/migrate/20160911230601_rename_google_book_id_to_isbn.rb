class RenameGoogleBookIdToIsbn < ActiveRecord::Migration[5.0]
  def change
    rename_column :book_suggestions, :google_book_id, :isbn
    rename_column :book_votes, :google_book_id, :isbn
    rename_column :selected_books, :google_book_id, :isbn
  end
end
