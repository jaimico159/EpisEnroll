class Admins::SecretariesController < ApplicationController
  #before_action :authenticate_admin!
  before_action :set_admin, only: %i[show edit update destroy]

  def index
    @secretaries = Admin.where(admin_role: :secretary)
  end

  def new
    @secretary = Admin.new
  end

  def show
  end

  def edit
  end

  def create
    @secretary = Admin.new(admin_params)
    @secretary.admin_role = :secretary

    respond_to do |format|
      if @secretary.save
        format.html { redirect_to admins_secretaries_path(@secretary), notice: 'secretary was succesfully created' }
        format.json { render :show, status: :created, location: admins_secretaries_path(@secretary) }
      else
        format.html { render admins_secretaries_path }
        format.json { render json: @secretary.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @secretary.update(admin_params)
        format.html { redirect_to admins_secretaries_path(@secretary), notice: 'User was successfully updated.' }
        format.json { render admins_secretaries_path, status: :ok, location: admins_secretaries_path(@secretary) }
      else
        format.html { render edit_admins_secretaries_path}
        format.json { render json: @secretary.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @secretary.destroy
    respond_to do |format|
      format.html { redirect_to admins_secretaries_path(@secretary), notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_admin
    @secretary = Admin.where(id: params[:id], admin_role: :secretary).first
  end

  def admin_params
    params.fetch(:admin, {}).permit(:first_name, :last_name, :email)
  end
  
end
