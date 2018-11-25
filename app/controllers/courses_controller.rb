class CoursesController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_course, only: %i[show edit update destroy]

  def index
    authorize current_admin
    @courses = Course.all
  end

  def new
    authorize current_admin
    @course = Course.new
  end

  def show
	end

  def edit
  end
  
  def create
    authorize current_admin
    @course = Course.new(course_params)
    respond_to do |format|
      if @course.save
        format.html { redirect_to @course, notice: 'Course was succesfully created' }
        format.json { render :show, status: :created, location: @course }
      else
        format.html { render :new }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @course.update(course_params)
        format.html { redirect_to @course, notice: 'Course was successfully updated.' }
        format.json { render :show, status: :ok, location: @course }
      else
        format.html { render :edit }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @course.destroy
    respond_to do |format|
      format.html { redirect_to courses_url, notice: 'Course was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(request.referrer || root_path)
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_course
    authorize current_admin
    @course = Course.find(params[:id])
  end

  def course_params
    params.fetch(:course, {}).permit(:name, :code, :has_laboratory, :description)
  end
end