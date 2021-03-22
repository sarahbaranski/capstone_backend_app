class Student < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: true
  has_many :shift_requests
  has_many :shifts, through: :shift_requests
  # has_many :semesters, through: :shifts
  belongs_to :position

  def full_name
    "#{first_name} #{last_name}"
  end

  def hours_each_semester
    result = Hash.new(0)
    shift_requests.each do |shift_request|
      result[shift_request.shift.semester.name] += 4 if shift_request.scheduled
    end
    return result.to_a
  end
end
