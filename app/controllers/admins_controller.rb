class AdminsController < ApplicationController
	before_action :authenticate_admin!
  before_action :set_admin, only: %i[show edit update destroy]
  
  def index
    authorize current_admin
    @admins = Admin.all
  end

  def new
    authorize current_admin
    @admin = Admin.new
  end

  def show
  end

  def edit
  end

  def create
    authorize current_admin
    @admin = Admin.new(admin_params)
    @admin.first_name =  @admin.first_name.upcase
    @admin.last_name =  @admin.last_name.upcase

    respond_to do |format|
      if @admin.save
        format.html { redirect_to @admin, notice: 'Admin was succesfully created' }
        format.json { render :@admin.show, status: :created, location: @admin }
      else
        format.html { render :new }
        format.json { render json: @admin.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @admin.update(admin_params)
        format.html { redirect_to @admin, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin }
      else
        format.html { render :edit }
        format.json { render json: @admin.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @admin.destroy
    respond_to do |format|
      format.html { redirect_to admin_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(request.referrer || root_path)
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_admin
    authorize current_admin
    @admin = Admin.find(params[:id])
  end

  def admin_params
    params.fetch(:admin, {}).permit(:first_name, :last_name, :email, :admin_role, :description)
  end 

end
