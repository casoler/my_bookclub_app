class Group < ApplicationRecord
  has_many :members
  has_many :users, through: :members
  has_many :past_books
end
