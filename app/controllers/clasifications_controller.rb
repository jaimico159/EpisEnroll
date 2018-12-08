class ClasificationsController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_clasification, only: %i[show edit update destroy]

  def index
    authorize current_admin, policy_class: ClasificationPolicy
    @clasifications = Clasification.all
  end

  def new
    authorize current_admin, policy_class: ClasificationPolicy
    @clasification = Clasification.new
  end
  
  def show
  end

  def edit
  end

  def create
    authorize current_admin, policy_class: ClasificationPolicy
    @clasification = Clasification.new(clasification_params)

    respond_to do |format|
      if @clasification.save
        format.html { redirect_to @clasification, notice: 'Clasification was succesfully created' }
        format.json { render :show, status: :created, location: @clasification }
      else
        format.html { render :new }
        format.json { render json: @clasification.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @clasification.update(clasification_params)
        format.html { redirect_to @clasification, notice: 'Clasification was successfully updated.' }
        format.json { render :show, status: :ok, location: @clasification }
      else
        format.html { render :edit }
        format.json { render json: @clasification.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @clasification.destroy
    respond_to do |format|
      format.html { redirect_to clasification_url, notice: 'Clasification was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(request.referrer || root_path)
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_clasification
    authorize current_admin, policy_class: ClasificationPolicy
    @clasification = Clasification.find(params[:id])
  end

  def clasification_params
    params.fetch(:clasification, {}).permit(:name, :value, :start_date, :finish_date, :description)
  end
end
  