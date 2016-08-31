class AddFieldsToPastBooks < ActiveRecord::Migration[5.0]
  def change
    add_column :past_books, :month, :integer
    add_column :past_books, :year, :integer
  end
end
