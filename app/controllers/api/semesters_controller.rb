class Api::SemestersController < ApplicationController
  def index
    @semesters = Semester.all
    render "index.json.jb"
  end
end
