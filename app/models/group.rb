class Group < ApplicationRecord
  has_many :members
  has_many :users, through: :members
  has_many :selected_books
  has_many :book_suggestions
  has_many :genres
  has_many :meetings

  validates :name, presence: true
  validates :name, uniqueness: true
  validates :city, presence: true
  validates :state, presence: true

  def add_member(data)  
    puts data
    user_id = data[:user_id]
    leader_flag = data[:leader_flag]

    @member = Member.new(
      user_id: user_id,
      group_id: id,
      leader_flag: leader_flag
    )
    @member.save
  end

  def is_member?(user)
    members.where(user_id: user.id).count == 1
  end

  def send_emails
    members
  end
end
