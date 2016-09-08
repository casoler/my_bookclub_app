class RemoveGenreFromGroupTable < ActiveRecord::Migration[5.0]
  def change
    remove_column :groups, :genres
  end
end
