class Api::StudentsController < ApplicationController
  def create
    student = Student.new(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation],
      position_id: 1,
      requested_hours: 20,
      work_study: 1720,
    )
    if student.save
      render json: { message: "Student created successfully" }, status: :created
    else
      render json: { errors: student.errors.full_messages }, status: :bad_request
    end
  end

  def show
    @student = Student.find_by(id: params[:id])
    render "show.json.jb"
  end
end
