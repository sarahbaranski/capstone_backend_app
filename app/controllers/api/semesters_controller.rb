class Api::SemestersController < ApplicationController
  def index
    if current_student || current_supervisor
      @semesters = Semester.all
      render "index.json.jb"
    else
      render json: []
    end
  end

  def show
    @semester = Semester.find_by(id: params[:id])
    render "show.json.jb"
  end
end
