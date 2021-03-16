class Shift < ApplicationRecord
  belongs_to :semester
  belongs_to :supervisor
  has_many :shift_requests
  has_many :students, through: :shift_requests
end
