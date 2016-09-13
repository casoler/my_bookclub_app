class Meeting < ApplicationRecord
  belongs_to :group
  belongs_to :selected_book
end
