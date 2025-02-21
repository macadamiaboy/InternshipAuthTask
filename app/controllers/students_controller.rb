class StudentsController < ApplicationController
  before_action :set_school!, only: [:index]
  before_action :set_schoolclass!, only: [:index]

  def index
    students_of_the_class = @schoolclass.students
    render json: students_of_the_class
  end

  def create
  end

  def destroy
  end

  private

  def student_params
    params.permit(:first_name, :last_name, :surname, :schoolclass_id, :school_id)
  end

  def set_school!
    @school = School.find params[:school_id]
  end

  def set_schoolclass!
    @schoolclass = @school.schoolclasses.find params[:schoolclass_id]
  end
end
