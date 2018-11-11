class AdminsController < ApplicationController
	before_action :authenticate_admin!
  before_action :set_admin, only: %i[show edit update destroy]

  def index
    @admins = Admin.all
  end

  def admin_views
    @admins = Admin.all
    render template: 'admins/admin_views/admins.html.erb'
  end

  def new
    @admin = Admin.new
  end

  def new_admin
    @admin = Admin.new
    render template: 'admins/admin_views/new_admin.html.erb'
  end

  def show
  end

  def show_admin
    set_admin
    render template: 'admins/admin_views/show_admin.html.erb'
  end

  def edit
    
  end


  def edit_admin
    set_admin
    render template: 'admins/admin_views/edit_admin.html.erb'
  end

  def create
    @admin = Admin.new(admin_params)

    respond_to do |format|
      if @admin.save
        format.html { redirect_to @admin, notice: 'Admin was succesfully created' }
        format.json { render :show, status: :created, location: @admin }
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

  # Use callbacks to share common setup or constraints between actions.
  def set_admin
    @admin = Admin.find(params[:id])
  end

  def admin_params
    params.fetch(:admin, {}).permit(:first_name, :last_name, :email, :admin_role)
  end
end
