class SchoolclassesController < ApplicationController
  skip_before_action :authorized
  before_action :set_school!

  def index
    render json: @school.schoolclasses
  end

  private

  def set_school!
    @school = School.find params[:school_id]
  end
end
