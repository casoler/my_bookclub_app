class AddSelectedBookToMeeting < ActiveRecord::Migration[5.0]
  def change
    add_column :meetings, :selected_book_id, :integer
  end
end
