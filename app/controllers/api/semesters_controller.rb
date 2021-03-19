class Api::SemestersController < ApplicationController
  def index
    if current_student || current_supervisor
      @semesters = Semester.all
      render "index.json.jb"
    else
      render json: []
    end
  end

  def create
    @semester = Semester.new(
      supervisor_id: 1,
      name: params[:name],
      start_date: params[:start_date],
      end_date: params[:end_date],
    )
    if @semester.save
      Shift.create!(semester_id: @semester.id, day: "Monday", time: "morning", supervisor_id: 1, total_required_staff: 0)
      Shift.create!(semester_id: @semester.id, day: "Monday", time: "afternoon", supervisor_id: 1, total_required_staff: 0)
      Shift.create!(semester_id: @semester.id, day: "Monday", time: "evening", supervisor_id: 1, total_required_staff: 0)
      Shift.create!(semester_id: @semester.id, day: "Tuesday", time: "morning", supervisor_id: 1, total_required_staff: 0)
      Shift.create!(semester_id: @semester.id, day: "Tuesday", time: "afternoon", supervisor_id: 1, total_required_staff: 0)
      Shift.create!(semester_id: @semester.id, day: "Tuesday", time: "evening", supervisor_id: 1, total_required_staff: 0)
      Shift.create!(semester_id: @semester.id, day: "Wednesday", time: "morning", supervisor_id: 1, total_required_staff: 0)
      Shift.create!(semester_id: @semester.id, day: "Wednesday", time: "afternoon", supervisor_id: 1, total_required_staff: 0)
      Shift.create!(semester_id: @semester.id, day: "Wednesday", time: "evening", supervisor_id: 1, total_required_staff: 0)
      Shift.create!(semester_id: @semester.id, day: "Thursday", time: "morning", supervisor_id: 1, total_required_staff: 0)
      Shift.create!(semester_id: @semester.id, day: "Thursday", time: "afternoon", supervisor_id: 1, total_required_staff: 0)
      Shift.create!(semester_id: @semester.id, day: "Thursday", time: "evening", supervisor_id: 1, total_required_staff: 0)
      Shift.create!(semester_id: @semester.id, day: "Friday", time: "morning", supervisor_id: 1, total_required_staff: 0)
      Shift.create!(semester_id: @semester.id, day: "Friday", time: "afternoon", supervisor_id: 1, total_required_staff: 0)
      Shift.create!(semester_id: @semester.id, day: "Friday", time: "evening", supervisor_id: 1, total_required_staff: 0)
      Shift.create!(semester_id: @semester.id, day: "Saturday", time: "morning", supervisor_id: 1, total_required_staff: 0)
      Shift.create!(semester_id: @semester.id, day: "Saturday", time: "afternoon", supervisor_id: 1, total_required_staff: 0)
      Shift.create!(semester_id: @semester.id, day: "Saturday", time: "evening", supervisor_id: 1, total_required_staff: 0)
      Shift.create!(semester_id: @semester.id, day: "Sunday", time: "morning", supervisor_id: 1, total_required_staff: 0)
      Shift.create!(semester_id: @semester.id, day: "Sunday", time: "afternoon", supervisor_id: 1, total_required_staff: 0)
      Shift.create!(semester_id: @semester.id, day: "Sunday", time: "evening", supervisor_id: 1, total_required_staff: 0)
      render "show.json.jb"
    else
      render json: { errors: @semester.errors.full_messages }, status: 422
    end
  end

  def show
    @semester = Semester.find_by(id: params[:id])
    render "show.json.jb"
  end
end
