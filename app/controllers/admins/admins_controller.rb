class Admins::AdminsController < ApplicationController
  #before_action :authenticate_admin!
  before_action :set_admin, only: %i[show edit update destroy]

  def index
    @admins = Admin.where(admin_role: "admin")
  end

  def show
  end

  def edit
  end

  def new
    @admin = Admin.new
  end

  def create
    @admin = Admin.new(admin_params)
    @admin.admin_role = "admin"

    respond_to do |format|
      if @admin.save
        format.html { redirect_to [:admins, @admin], notice: 'Admin was succesfully created' }
        format.json { render :show, status: :created, location: [:admins, @admin] }
      else
        format.html { render [:admins, :new] }
        format.json { render json: @admin.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @admin.update(admin_params)
        format.html { redirect_to [:admins, @admin ], notice: 'Admin was successfully updated.' }
        format.json { render [:admins, :show], status: :ok, location: [:admins, @admin] }
      else
        format.html { render [:admins, :edit]}
        format.json { render json: @admin.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @admin.destroy
    respond_to do |format|
      format.html { redirect_to admins_admins_path, notice: 'Admin was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_admin
    @admin = Admin.where(id: params[:id], admin_role: "admin").first
  end

  def admin_params
    params.fetch(:admin, {}).permit(:first_name, :last_name, :email)
  end
  
end
