class CreatePastBooks < ActiveRecord::Migration[5.0]
  def change
    create_table :past_books do |t|
      t.integer :group_id
      t.integer :book_id

      t.timestamps
    end
  end
end
