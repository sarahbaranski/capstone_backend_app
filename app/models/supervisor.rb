class Supervisor < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: true

  has_many :semesters
  has_many :shifts
end
