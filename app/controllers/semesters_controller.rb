class SemestersController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_semester, only: %i[show edit update destroy]

  def index
    authorize current_admin, policy_class: SemesterPolicy
    @semesters = Semester.all
  end

  def new
    authorize current_admin, policy_class: SemesterPolicy
    @semester = Semester.new
  end
  
  def show
  end

  def edit
  end

  def create
    authorize current_admin, policy_class: SemesterPolicy
    @semester = Semester.new(semester_params)

    respond_to do |format|
      if @semester.save
        format.html { redirect_to @semester, notice: 'Semester was succesfully created' }
        format.json { render :show, status: :created, location: @semester }
      else
        format.html { render :new }
        format.json { render json: @semester.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @semester.update(semester_params)
        format.html { redirect_to @semester, notice: 'Semester was successfully updated.' }
        format.json { render :show, status: :ok, location: @semester }
      else
        format.html { render :edit }
        format.json { render json: @semester.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @semester.destroy
    respond_to do |format|
      format.html { redirect_to semester_url, notice: 'Semester was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(request.referrer || root_path)
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_semester
    authorize current_admin, policy_class: SemesterPolicy
    @semester = Semester.find(params[:id])
  end

  def semester_params
    params.fetch(:semester, {}).permit(:is_even, :start_date, :finish_date, :backup)
  end
end
