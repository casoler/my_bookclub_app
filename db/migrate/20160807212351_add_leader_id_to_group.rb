class AddLeaderFlagToMembers < ActiveRecord::Migration[5.0]
  def change
    add_column :members, :leader_flag, :boolean, default: false
  end
end
