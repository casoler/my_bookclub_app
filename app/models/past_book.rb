class PastBook < ApplicationRecord
  belongs_to :group
  belongs_to :book
end
