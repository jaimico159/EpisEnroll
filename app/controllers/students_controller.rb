class StudentsController < ApplicationController
  before_action :authenticate_student!
  before_action :set_user, only: %i[show edit update destroy]

  def index
    @students = Student.all
  end

  def new
    @student = Student.new
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def set_user
    @student = Student.find(params[:id])
  end

  def student_params
    params.fetch(:student, {}).permit(:first_name, :last_name, :email, :cui, :description, :clasification_id)
  end
end
