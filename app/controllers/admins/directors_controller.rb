class Admins::DirectorsController < ApplicationController
  #before_action :authenticate_admin!
  before_action :set_admin, only: %i[show edit update destroy]

  def index
    @directors = Admin.where(admin_role: :director)
  end

  def new
    @director = Admin.new
  end

  def show
  end

  def edit
  end

  def create
    @director = Admin.new(admin_params)
    @director.admin_role = :director

    respond_to do |format|
      if @director.save
        format.html { redirect_to admins_directors_path(@director), notice: 'director was succesfully created' }
        format.json { render :show, status: :created, location: admins_directors_path(@director) }
      else
        format.html { render admins_directors_path }
        format.json { render json: @director.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @director.update(admin_params)
        format.html { redirect_to admins_directors_path(@director), notice: 'director was successfully updated.' }
        format.json { render admins_directors_path, status: :ok, location: admins_directors_path(@director) }
      else
        format.html { render edit_admins_directors_path}
        format.json { render json: @director.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @director.destroy
    respond_to do |format|
      format.html { redirect_to admins_directors_path(@director), notice: 'director was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_admin
    @director = Admin.where(id: params[:id], admin_role: :director).first
  end

  def admin_params
    params.fetch(:admin, {}).permit(:first_name, :last_name, :email)
  end
end
