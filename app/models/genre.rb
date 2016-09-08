class Genre < ApplicationRecord
  has_many :group_genres
  has_many :groups, through: :group_genres
end
