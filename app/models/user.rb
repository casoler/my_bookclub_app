class User < ApplicationRecord
  has_secure_password

  has_many :members
  has_many :groups, through: :members

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :zip_code, presence: true

  validates :email, uniqueness: true
end
