class Semester < ApplicationRecord
  has_many :shifts
  belongs_to :supervisor
end
