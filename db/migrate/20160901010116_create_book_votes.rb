class CreateBookVotes < ActiveRecord::Migration[5.0]
  def change
    create_table :book_votes do |t|
      t.integer :member_id
      t.string :google_book_id

      t.timestamps
    end
  end
end
