class Semester < ApplicationRecord
  has_many :shifts
  belongs_to :supervisor

  def shift_by_times
    slots = [
      { day: "Monday", time: "morning", students: [] },
      { day: "Monday", time: "afternoon", students: [] },
      { day: "Monday", time: "evening", students: [] },
      { day: "Tuesday", time: "morning", students: [] },
      { day: "Tuesday", time: "afternoon", students: [] },
      { day: "Tuesday", time: "evening", students: [] },
      { day: "Wednesday", time: "morning", students: [] },
      { day: "Wednesday", time: "afternoon", students: [] },
      { day: "Wednesday", time: "evening", students: [] },
      { day: "Thursday", time: "morning", students: [] },
      { day: "Thursday", time: "afternoon", students: [] },
      { day: "Thursday", time: "evening", students: [] },
      { day: "Friday", time: "morning", students: [] },
      { day: "Friday", time: "afternoon", students: [] },
      { day: "Friday", time: "evening", students: [] },
      { day: "Saturday", time: "morning", students: [] },
      { day: "Saturday", time: "afternoon", students: [] },
      { day: "Saturday", time: "evening", students: [] },
      { day: "Sunday", time: "morning", students: [] },
      { day: "Sunday", time: "afternoon", students: [] },
      { day: "Sunday", time: "evening", students: [] },
    ]
    slots.each do |slot|
      shifts.each do |shift|
        if shift.day == slot[:day] && shift.time == slot[:time]
          slot[:total_required_staff] = shift.total_required_staff
          slot[:students] << { student_name: shift.student.full_name, shift_id: shift.id, scheduled: shift.scheduled } if shift.requested
        end
      end
    end
    return slots
  end
end
