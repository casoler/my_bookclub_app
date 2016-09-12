class RenameGenresDescriptionToDisplayName < ActiveRecord::Migration[5.0]
  def change
    rename_column :genres, :description, :display_name
  end
end
