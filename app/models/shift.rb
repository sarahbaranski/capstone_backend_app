class Shift < ApplicationRecord
  belongs_to :student
  belongs_to :semester
  belongs_to :supervisor
end
