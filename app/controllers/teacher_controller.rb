class TeacherController < ApplicationController
	before_action :authenticate_teacher!
  	before_action :set_user, only: %i[show edit update destroy]

	def index
		@teacher = Teacher.all
	end

	def new
		@teacher = Teacher.new
	end

	def show
	end

	def edit
	end

	def update
	end

	def destroy
	end

	private

	def set_user
    	@teacher = Teacher.find(params[:id])
 	end

  	def student_params
    	params.fetch(:teacher, {}).permit(:first_name, :last_name, :email, :description, :status)
  	end
end
