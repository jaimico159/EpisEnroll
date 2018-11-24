class TeachersController < ApplicationController
  before_action :authenticate_teacher!
  before_action :set_user, only: %i[show edit update destroy]

  def home
    @teacher = current_teacher
  end
  
  def my_labs
	@laboratories = current_teacher.laboratories
	@teacher = current_teacher
  end

	def index
		@teachers = Teacher.all
	end

	def new
		@teacher = Teacher.new
	end

	def show
	end

	def edit
	end
	
	def create
    	@teacher = Teacher.new(teacher_params)
     	respond_to do |format|
    	  	if @teacher.save
        		format.html { redirect_to @teacher, notice: 'Teacher was succesfully created' }
        		format.json { render :show, status: :created, location: @teacher }
      		else
        		format.html { render :new }
        		format.json { render json: @teacher.errors, status: :unprocessable_entity }
      		end
    	end
  	end

	def update
		respond_to do |format|
     		if @teacher.update(teacher_params)
        		format.html { redirect_to @teacher, notice: 'Teacher was successfully updated.' }
        		format.json { render :show, status: :ok, location: @Teacher }
      		else
        		format.html { render :edit }
       			format.json { render json: @teacher.errors, status: :unprocessable_entity }
      		end
    	end
	end

	def destroy
		@teacher.destroy
    	respond_to do |format|
      		format.html { redirect_to teacher_url, notice: 'Teacher was successfully destroyed.' }
      		format.json { head :no_content }
    	end
	end

	private

	def set_user
    	@teacher = Teacher.find(params[:id])
 	end

  	def teacher_params
    	params.fetch(:teacher, {}).permit(:first_name, :last_name, :email, :description, :status)
  	end
end
