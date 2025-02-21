class StudentsController < ApplicationController
  protect_from_forgery with: :null_session

  skip_before_action :authorized, except: [:destroy]
  before_action :set_school!, only: [:index]
  before_action :set_schoolclass!, only: [:index]
  before_action :set_student!, only: [:destroy]

  def index
    students_of_the_class = @schoolclass.students
    render json: students_of_the_class
  end

  def create
    unless School.exists?(id: student_params[:school_id]) && Schoolclass.exists?(id: student_params[:schoolclass_id])
      render json: "There's no such school or class", status: :method_not_allowed
      return
    end

    unless School.find(student_params[:school_id]).schoolclasses.include? Schoolclass.find(student_params[:schoolclass_id])
      render json: "There's no such class in that school", status: :method_not_allowed
      return
    end

    student = Student.new student_params
    if student.save
      token = encode_token(student_id: student.id)
      response.headers['X-Auth-Token'] = token
      render json: "Success", status: :created
    else
      render json: "Invalid input data. Check and try again", status: :method_not_allowed
    end
  end

  def destroy
    if @student_to_delete == current_student
      @student_to_delete.delete
    else
      render json: "You cannot delete someone's account", status: :unauthorized
    end
  end

  private

  def student_params
    params.permit(:first_name, :last_name, :surname, :schoolclass_id, :school_id)
  end

  def set_school!
    @school = School.find student_params[:school_id]
  end

  def set_schoolclass!
    @schoolclass = @school.schoolclasses.find student_params[:schoolclass_id]
  end

  def set_student!
    if Student.exists?(id: params[:id])
      @student_to_delete = Student.find params[:id]
    else
      render json: "Incorrect student's id", status: :bad_request
    end
  end
end
