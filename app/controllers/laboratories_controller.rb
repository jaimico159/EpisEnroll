class LaboratoriesController < ApplicationController
  before_action :authenticate_student!
  before_action :set_laboratory, only: %i[show edit update destroy]

  def index
    @laboratories = Laboratory.all
  end

  def new
    @laboratory = Laboratory.new
  end

  def create
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

  # Use callbacks to share common setup or constraints between actions.
  def set_laboratory
    @laboratory = Laboratory.find(params[:id])
  end

  def laboratory_params
    params.fetch(:laboratory, {}).permit(:quota, :description, :course_id, :group_id, :teacher_id)
  end
end
