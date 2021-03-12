class Api::SemestersController < ApplicationController
  def index
    if current_student
      @semesters = Semester.all
      render "index.json.jb"
    else
      render json: []
    end
  end
end
