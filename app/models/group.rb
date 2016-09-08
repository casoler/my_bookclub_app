class Group < ApplicationRecord
  has_many :members
  has_many :users, through: :members
  has_many :selected_books
  has_many :book_suggestions
  has_many :group_genres
  has_many :genres, through: :group_genres
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
    @member
  end

  def is_member?(user)
    members.where(user_id: user.id).count == 1
  end

  def group_leader
    members.find_by(leader_flag: true)
  end

  def send_emails
    members
  end

  def this_months_book
    this_month = Time.now
    selected_books.order(:year, :month).find_by(month: this_month.month, year: this_month.year)
  end

  def next_months_book
    this_month = Time.now
    next_month = this_month + 1.month
    selected_books.order(:year, :month).find_by(month: next_month.month, year: next_month.year)
  end

  def past_books
    this_month = Time.now
    selected_books.order(:year, :month).find_all {|book| book.month < this_month.month && book.year <= this_month.year}
  end
end
