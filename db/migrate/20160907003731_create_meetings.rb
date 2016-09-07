class CreateMeetings < ActiveRecord::Migration[5.0]
  def change
    create_table :meetings do |t|
      t.integer :group_id
      t.datetime :meeting_date
      t.string :location
      t.string :address
      t.string :city
      t.string :state
      t.integer :zip
      t.text :notes

      t.timestamps
    end
  end
end
