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
    Semester.find_by(id: params[:semester_id]).shifts.each do |shift|
      shift.shift_requests.where(student_id: current_student.id).destroy_all
    end
    params[:shift_ids].each do |shift_id|
      shift_request = ShiftRequest.create(
        shift_id: shift_id,
        student_id: current_student.id,
        requested: true,
        scheduled: false,
      )
    end
    render json: { message: "All shifts created!" }
  end

  def update
    @shift_request = ShiftRequest.find_by(id: params[:id])
    @shift_request.scheduled = params[:scheduled]
    @shift_request.save
    render "show.json.jb"
  end

  def notify
    client = Twilio::REST::Client.new
    client.messages.create({
      from: Rails.application.credentials.twilio_phone_number,
      to: "+16306320399",
      body: "The current schedule has been posted. Please login in to www.wami.com/login to view the new schedule.",
    })
    render json: { message: "Students have been notified." }
  end

  def destroy
    shift_request = ShiftRequest.find_by(id: params[:id])
    shift_request.destroy
    render json: { message: "Shift has been deleted." }
  end
end
