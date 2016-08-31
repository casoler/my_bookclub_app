class CreateBookSuggestions < ActiveRecord::Migration[5.0]
  def change
    create_table :book_suggestions do |t|
      t.integer :group_id
      t.string :google_book_id

      t.timestamps
    end
  end
end
