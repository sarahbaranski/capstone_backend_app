class ShiftRequest < ApplicationRecord
  belongs_to :shift
  belongs_to :student
end
