class Member < ApplicationRecord
  belongs_to :user
  belongs_to :group

  def self.get_leader(group)
    leader = where(group_id: group.id).where(leader_flag: true).first.user
  end

  def self.get_leader_name(group)
    # leader = get_leader(group)
    if leader = get_leader(group)
      "#{leader.user.first_name} #{leader.user.last_name}"
    else
      'No Leader'
    end
  end

  def group_leader?   #(group, user)
    leader_flag
    # leader = where(group_id: group.id).where(leader_flag: true).first
    # user
  end
end
