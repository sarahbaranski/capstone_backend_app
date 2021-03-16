class Api::ShiftRequestsController < ApplicationController
  def create
    @shift_request = ShiftRequest.new(
      student_id: current_student.id,
      requested: params[:requested],
      scheduled: params[:scheduled],
    )
    @shift_request.save
    render "show.json.jb"
  end

  def create_all
    shift_request = ShiftRequest.find_or_create_by(student_id: current_student.id, day: "Monday", time: "morning")
    shift_request.update(requested: false)
    shift_request = ShiftRequest.find_or_create_by(student_id: current_student.id, day: "Monday", time: "afternoon")
    shift_request.update(requested: false)
    shift_request = ShiftRequest.find_or_create_by(student_id: current_student.id, day: "Monday", time: "evening")
    shift_request.update(requested: false)
    shift_request = ShiftRequest.find_or_create_by(student_id: current_student.id, day: "Tuesday", time: "morning")
    shift_request.update(requested: false)
    shift_request = ShiftRequest.find_or_create_by(student_id: current_student.id, day: "Tuesday", time: "afternoon")
    shift_request.update(requested: false)
    shift_request = ShiftRequest.find_or_create_by(student_id: current_student.id, day: "Tuesday", time: "evening")
    shift_request.update(requested: false)
    shift_request = ShiftRequest.find_or_create_by(student_id: current_student.id, day: "Wednesday", time: "morning")
    shift_request.update(requested: false)
    shift_request = ShiftRequest.find_or_create_by(student_id: current_student.id, day: "Wednesday", time: "afternoon")
    shift_request.update(requested: false)
    shift_request = ShiftRequest.find_or_create_by(student_id: current_student.id, day: "Wednesday", time: "evening")
    shift_request.update(requested: false)
    shift_request = ShiftRequest.find_or_create_by(student_id: current_student.id, day: "Thursday", time: "morning")
    shift_request.update(requested: false)
    shift_request = ShiftRequest.find_or_create_by(student_id: current_student.id, day: "Thursday", time: "afternoon")
    shift_request.update(requested: false)
    shift_request = ShiftRequest.find_or_create_by(student_id: current_student.id, day: "Thursday", time: "evening")
    shift_request.update(requested: false)
    shift_request = ShiftRequest.find_or_create_by(student_id: current_student.id, day: "Friday", time: "morning")
    shift_request.update(requested: false)
    shift_request = ShiftRequest.find_or_create_by(student_id: current_student.id, day: "Friday", time: "afternoon")
    shift_request.update(requested: false)
    shift_request = ShiftRequest.find_or_create_by(student_id: current_student.id, day: "Friday", time: "evening")
    shift_request.update(requested: false)
    shift_request = ShiftRequest.find_or_create_by(student_id: current_student.id, day: "Saturday", time: "morning")
    shift_request.update(requested: false)
    shift_request = ShiftRequest.find_or_create_by(student_id: current_student.id, day: "Saturday", time: "afternoon")
    shift_request.update(requested: false)
    shift_request = ShiftRequest.find_or_create_by(student_id: current_student.id, day: "Saturday", time: "evening")
    shift_request.update(requested: false)
    shift_request = ShiftRequest.find_or_create_by(student_id: current_student.id, day: "Sunday", time: "morning")
    shift_request.update(requested: false)
    shift_request = ShiftRequest.find_or_create_by(student_id: current_student.id, day: "Sunday", time: "afternoon")
    shift_request.update(requested: false)
    shift_request = ShiftRequest.find_or_create_by(student_id: current_student.id, day: "Sunday", time: "evening")
    shift_request.update(requested: false)
    params[:checked_times].each do |checked_time|
      day = checked_time.split(":")[0]
      time = checked_time.split(":")[1]
      shift_request = ShiftRequest.find_by(student_id: current_student.id, day: day, time: time, requested: false)
      shift_request.requested = true
      shift_request.save
    end
    render json: { message: "All shifts created!" }
  end

  def destroy
    shift_request = ShiftRequest.find_by(id: params[:id])
    shift_request.destroy
    render json: { message: "Shift has been deleted." }
  end
end
