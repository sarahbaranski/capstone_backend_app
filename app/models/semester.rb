class Semester < ApplicationRecord
  has_many :shifts
  belongs_to :supervisor

  def shift_by_times
    slots = [
      { day: "Monday", time: "morning", students: [] },
      { day: "Monday", time: "afternoon", students: [] },
    ]
    slots.each do |slot|
      shifts.each do |shift|
        if shift.day == slot[:day] && shift.time == slot[:time]
          slot[:total_required_staff] = shift.total_required_staff
          slot[:students] << { student_name: shift.student.full_name, shift_id: shift.id } if shift.requested
        end
      end
    end
    return slots
  end
end
