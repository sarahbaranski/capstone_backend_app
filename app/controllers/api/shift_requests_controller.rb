class Api::ShiftRequestsController < ApplicationController
  def create
    @shift_request = Shift_Request.new(
      student_id: current_student.id,
      requested: params[:requested],
      scheduled: params[:scheduled],
    )
    @shift_request.save
    render "show.json.jb"
  end

  def destroy
    shift_request = Shift_Request.find_by(id: params[:id])
    shift_request.destroy
    render json: {message: "Shift has been deleted."}
  end
end
