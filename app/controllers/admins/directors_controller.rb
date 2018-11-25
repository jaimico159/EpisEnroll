class Admins::DirectorsController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_admin, only: %i[show edit update destroy]

  def home
    authorize current_admin, policy_class: Admin::DirectorPolicy
    @director = current_admin
  end

  def index
    authorize current_admin, policy_class: Admin::DirectorPolicy
    @directors = Admin.where(admin_role: :director)
  end

  def new
    authorize current_admin, policy_class: Admin::DirectorPolicy
    @director = Admin.new
  end

  def show
  end

  def edit
  end

  def create
    authorize current_admin, policy_class: Admin::DirectorPolicy
    @director = Admin.new(admin_params)
    @director.admin_role = :director

    respond_to do |format|
      if @director.save
        format.html { redirect_to admins_directors_path(@director), notice: 'director was succesfully created' }
        format.json { render :show, status: :created, location: admins_directors_path(@director) }
      else
        format.html { render :new }
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

  def user_not_authorized
    flash[:alert] = "You are not allowed to perform this action"
    redirect_to(request.referrer || root_path)
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_admin
    authorize current_admin, policy_class: Admin::DirectorPolicy
    @director = Admin.where(id: params[:id], admin_role: :director).first
  end

  def admin_params
    params.fetch(:admin, {}).permit(:first_name, :last_name, :email)
  end
end
