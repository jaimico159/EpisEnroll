class LaboratoriesController < ApplicationController
  before_action :authenticate_admin!, except: %i[show]
  before_action :authenticate_teacher!, only: %i[show]
  before_action :set_laboratory, only: %i[show edit update destroy]

  def index
    authorize current_admin, policy_class: LaboratoryPolicy
    @laboratories = Laboratory.all
  end

  def new
    authorize current_admin, policy_class: LaboratoryPolicy
    @laboratory = Laboratory.new
    @courses_with_lab = Course.where(has_laboratory: true)
  end

  def show
    @enrollmentDetails = @laboratory.enrollment_details
  end

  def edit
    authorize current_admin, policy_class: LaboratoryPolicy
    group_lab_ids = Laboratory.where(course_id: @laboratory.course_id).pluck(:group_id).select{|id| id != @laboratory.group_id}
    @unused = Group.where.not(id: group_lab_ids)
  end

  def create
    authorize current_admin, policy_class: LaboratoryPolicy
    @laboratory = Laboratory.new(laboratory_params)
    
    respond_to do |format|
      if @laboratory.save
        format.html { redirect_to @laboratory, notice: 'Laboratory was succesfully created' }
        format.json { render :show, status: :created, location: @laboratory }
      else
        format.html { render :new }
        format.json { render json: @laboratory.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @laboratory.update(laboratory_params)
        format.html { redirect_to @laboratory, notice: 'Laboratory was successfully updated.' }
        format.json { render :show, status: :ok, location: @laboratory }
      else
        format.html { render :edit }
        format.json { render json: @laboratory.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @laboratory.destroy
    respond_to do |format|
      format.html { redirect_to laboratories_url, notice: 'Laboratory was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def user_not_authorized
    flash[:alert] = "You are not allowed to perform this action"
    redirect_to(request.referrer || root_path)
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_laboratory
    authorize current_admin, policy_class: LaboratoryPolicy
    @laboratory = Laboratory.find(params[:id])
  end

  def laboratory_params
    params.fetch(:laboratory, {}).permit(:quota, :description, :course_id, :group_id, :teacher_id)
  end
end
