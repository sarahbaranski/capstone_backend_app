class Api::ShiftsController < ApplicationController
  def index
    @shifts = Shift.all
    render "index.json.jb"
  end

  def create
    @shift = Shift.new({
      student_id: params["student_id"],
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
