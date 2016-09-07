class CreateGroupGenres < ActiveRecord::Migration[5.0]
  def change
    create_table :group_genres do |t|
      t.integer :group_id
      t.integer :genre_id

      t.timestamps
    end
  end
end
