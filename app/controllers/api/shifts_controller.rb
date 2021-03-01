class Api::ShiftsController < ApplicationController
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
end
