class AddFieldsToGroup < ActiveRecord::Migration[5.0]
  def change
    add_column :groups, :genres, :string
    add_column :groups, :about, :text
    add_column :groups, :city, :string
    add_column :groups, :state, :string
    add_column :groups, :zip_code, :integer
  end
end
