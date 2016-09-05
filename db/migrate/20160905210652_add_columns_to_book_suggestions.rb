class AddColumnsToBookSuggestions < ActiveRecord::Migration[5.0]
  def change
    add_column :book_suggestions, :title, :string
    add_column :book_suggestions, :author, :string
    add_column :book_suggestions, :image_url, :string
    add_column :book_suggestions, :description, :text
  end
end
