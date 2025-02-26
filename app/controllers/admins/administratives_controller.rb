class Admins::AdministrativesController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_administrative, only: %i[show edit update destroy]

  def home
    authorize current_admin, policy_class: Admin::AdministrativePolicy
    @administrative = current_admin
  end

  def index
    authorize current_admin, policy_class: Admin::AdministrativePolicy
    @administratives = Admin.where(admin_role: "administrative")
  end

  def show
  end

  def edit
  end

  def new
    authorize current_admin, policy_class: Admin::AdministrativePolicy
    @administrative = Admin.new
  end

  def create
    authorize current_admin, policy_class: Admin::AdministrativePolicy
    @administrative = Admin.new(administrative_params)
    @administrative.admin_role = "administrative"

    respond_to do |format|
      if @administrative.save
        format.html { redirect_to admins_administrative_path(@administrative), notice: 'Administrative was succesfully created' }
        format.json { render :show, status: :created, location: admins_administrative_path(@administrative) }
      else
        format.html { render :new }
        format.json { render json: @administrative.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @administrative.update(administrative_params)
        format.html { redirect_to admins_administrative_path(@administrative), notice: 'Administrative was successfully updated.' }
        format.json { render admins_administrative_path, status: :ok, location: admins_administrative_path(@administrative) }
      else
        format.html { render edit_admins_administrative_path(@administrative)}
        format.json { render json: @administrative.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @administrative.destroy
    respond_to do |format|
      format.html { redirect_to admins_administrative_path(@administrative), notice: 'Administrative was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  
  def user_not_authorized
    flash[:alert] = "You are not allowed to perform this action"
    redirect_to(request.referrer || root_path)
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_administrative
    authorize current_admin, policy_class: Admin::AdministrativePolicy
    @administrative = Admin.where(id: params[:id], admin_role: "administrative").first
  end

  def administrative_params
    params.fetch(:admin, {}).permit(:first_name, :last_name, :email)
  end
  
end
