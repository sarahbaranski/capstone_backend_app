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
      Shift.create(semester_id: @semester.id, supervisor_id: 1, day: params[:day], time: params[:time], total_required_staff: params[:total_required_staff])
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
