# a Book class
class Book < ApplicationRecord
  # has_many :groups, through: :selected_books
  self.per_page = 10
end
