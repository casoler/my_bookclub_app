class Book < ApplicationRecord
  has_many :past_books
  has_many :groups, through: :past_books
end
