class SelectedBook < ApplicationRecord
  belongs_to :group
  has_one :meeting
end
