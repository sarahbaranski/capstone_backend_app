class Api::ShiftsController < ApplicationController
  def index
    @shifts = Shift.all
    render "index.json.jb"
  end

  def create
    # shift = current_student.shift.where(status: )
    @shift = Shift.new({
      student_id: current_student.id,
      semester_id: params["semester_id"],
      day: params["day"],
      time: params["time"],
      requested: params["requested"],
      supervisor_id: 1,
      scheduled: params["scheduled"],
      total_required_staff: params["total_required_staff"],
    })
    if @shift.save
      render "show.json.jb"
    else
      render json: { errors: @shift.errors.full_messages }, status: 422
    end
  end

  def show
    @shift = Shift.find_by(id: params[:id])
    render "show.json.jb"
  end

  def create_all
    shift = Shift.find_or_create_by(student_id: current_student.id, semester_id: params[:semester_id], day: "Monday", time: "morning")
    shift = Shift.find_or_create_by(student_id: current_student.id, semester_id: params[:semester_id], day: "Monday", time: "afternoon")
    shift = Shift.find_or_create_by(student_id: current_student.id, semester_id: params[:semester_id], day: "Monday", time: "evening")
    shift = Shift.find_or_create_by(student_id: current_student.id, semester_id: params[:semester_id], day: "Tuesday", time: "morning")
    shift = Shift.find_or_create_by(student_id: current_student.id, semester_id: params[:semester_id], day: "Tuesday", time: "afternoon")
    shift = Shift.find_or_create_by(student_id: current_student.id, semester_id: params[:semester_id], day: "Tuesday", time: "evening")
    shift = Shift.find_or_create_by(student_id: current_student.id, semester_id: params[:semester_id], day: "Wednesday", time: "morning")
    shift = Shift.find_or_create_by(student_id: current_student.id, semester_id: params[:semester_id], day: "Wednesday", time: "afternoon")
    shift = Shift.find_or_create_by(student_id: current_student.id, semester_id: params[:semester_id], day: "Wednesday", time: "evening")
    shift = Shift.find_or_create_by(student_id: current_student.id, semester_id: params[:semester_id], day: "Thursday", time: "morning")
    shift = Shift.find_or_create_by(student_id: current_student.id, semester_id: params[:semester_id], day: "Thursday", time: "afternoon")
    shift = Shift.find_or_create_by(student_id: current_student.id, semester_id: params[:semester_id], day: "Thursday", time: "evening")
    shift = Shift.find_or_create_by(student_id: current_student.id, semester_id: params[:semester_id], day: "Friday", time: "morning")
    shift = Shift.find_or_create_by(student_id: current_student.id, semester_id: params[:semester_id], day: "Friday", time: "afternoon")
    shift = Shift.find_or_create_by(student_id: current_student.id, semester_id: params[:semester_id], day: "Friday", time: "evening")
    shift = Shift.find_or_create_by(student_id: current_student.id, semester_id: params[:semester_id], day: "Saturday", time: "morning")
    shift = Shift.find_or_create_by(student_id: current_student.id, semester_id: params[:semester_id], day: "Saturday", time: "afternoon")
    shift = Shift.find_or_create_by(student_id: current_student.id, semester_id: params[:semester_id], day: "Saturday", time: "evening")
    shift = Shift.find_or_create_by(student_id: current_student.id, semester_id: params[:semester_id], day: "Sunday", time: "morning")
    shift = Shift.find_or_create_by(student_id: current_student.id, semester_id: params[:semester_id], day: "Sunday", time: "afternoon")
    shift = Shift.find_or_create_by(student_id: current_student.id, semester_id: params[:semester_id], day: "Sunday", time: "evening")
    params[:checked_times].each do |checked_time|
      day = checked_time.split(":")[0]
      time = checked_time.split(":")[1]
      shift = Shift.find_by(student_id: current_student.id, semester_id: params[:semester_id], day: day, time: time, requested: false)
      shift.requested = true
      shift.save
    end
    render json: { message: "All shifts created!" }
  end

  def update
    @shift = Shift.find_by(id: params["id"])
    @shift.scheduled = params["scheduled"] || @shift.scheduled
    @shift.total_required_staff = params["total_required_staff"] || @shift.total_required_staff

    if @shift.save
      render "show.json.jb"
    else
      render json: { errors: @shift.errors.full_message }, status: :unprocessable_entity
    end
  end
end
