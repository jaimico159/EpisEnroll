class StudentsController < ApplicationController
    
  before_action :authenticate_student!, only: %i[home enrollment validate_pdf]
  before_action :authenticate_admin!, only: %i[new edit show update destroy]
  before_action :set_user, only: %i[edit show update destroy]

  def home
    @student = current_student
    @courses = Course.where(code: @student.course_codes).select {|course| course.has_laboratory }

  end

  def index
    @students = Student.all
  end

  def new
    @student = Student.new
  end

  def show
  end

  def edit
  end

  def create
    @student = Student.new(student_params)
    @enrollment_header = EnrollmentHeader.new
    @enrollment_header.student = @student
    @enrollment_header.semester = Semester.last

    respond_to do |format|
      if @student.save && @enrollment_header.save
        format.html { redirect_to @student, notice: 'Student was succesfully created' }
        format.json { render :show, status: :created, location: @student }
      else
        format.html { render :new }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @student.update(student_params)
        format.html { redirect_to @student, notice: 'Student was successfully updated.' }
        format.json { render :show, status: :ok, location: @student }
      else
        format.html { render :edit }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @student.destroy
    respond_to do |format|
      format.html { redirect_to students_url, notice: 'Student was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def validate_pdf
    @student = current_student
  end

  def validate
    @student = current_student
    student_courses = []
    #File.open(params[:pdf].tempfile,"rb") do |file|
    reader = PDF::Reader.new(params[:pdf].tempfile)
    if reader.metadata.include?(reader.info[:Creator]) && reader.metadata.include?(reader.info[:Title])
      puts "Estas en el camino"
      if reader.pages.length == 1
        pdf_array = reader.pages.first.text.split("\n")
        if pdf_array[5].gsub(/[[:space:]]+/, " ").split(" ")[1][1..8].eql?(@student.cui.to_s) &&
            pdf_array[5].include?(@student.unsa_full_name) &&
            pdf_array[7].gsub(/[[:space:]]+/, " ").split(" ")[12].eql?(params[:dni]) &&
            pdf_array[7].gsub(/[[:space:]]+/, " ").split(" ").last.to_date.year == Date.today.year &&
            pdf_array[12].include?("INGENIERIA DE SISTEMAS")

          for i in 20..30
            splited_line = pdf_array[i].gsub(/[[:space]]+/, " ").split(" ")
            #puts "<<<<< #{splited_line}"
            if splited_line.first
              break if splited_line.first.include?("Tot") 
              course_cod = splited_line[1][0..2] + splited_line[2] + splited_line[3] + splited_line[1][3..4]
              student_courses.push(course_cod.to_i)
            end
          end
        else
          puts "NO SE QUE PASO"
        end
      end
    else
      respond_to do |format|
        format.html { redirect_to students_validate_pdf_path, alert: "Hubo un error o no es un documento válido" }
      end
    end

    student_courses = student_courses.select {|course| Course.exists?(code: course, has_laboratory: true)}

    if @student.update(course_codes: student_courses, certificate_uploaded: true)
      respond_to do |format|
        format.html { redirect_to students_home_path }
      end
    else
      respond_to do |format|
        format.html { redirect_to students_validate_pdf_path, alert: "Hubo un error intentalo otra vez" }
      end
    end
  end

  def enrollment
    @student = current_student
    if @student.authorized && @student.certificate_uploaded
      @chosen_labs = @student.enrollment_details
      @courses = Course.
        where(code: @student.course_codes).
        where.not(id: @chosen_labs.pluck(:course_id)).
        select {|course| 
          course.has_laboratory
        }
    end
  end

  def enroll_student
    @student = current_student
    if !@student.enrolled && @student.authorized && @student.certificate_uploaded && 
      @enrollment_detail = EnrollmentDetail.new
      @enrollment_detail.enrollment_header = @student.enrollment_header
      @enrollment_detail.laboratory = Laboratory.find([params[:course_id], params[:group_id]])
      if @enrollment_detail.save!
        if @student.course_codes.length == @student.enrollment_header.enrollment_details.size
          @student.update(enrolled: true)
        end
        respond_to do |format|
          format.html { redirect_to students_enrollment_path, notice: "Matricula registrada correctamente" }
        end
      else
        respond_to do |format|
          format.html { redirect_to students_enrollment_path, alert: "Hubo un error intentalo otra vez" }
        end
      end
    else
      respond_to do |format|
        format.html { redirect_to students_enrollment_path, alert: "No estás autorizado a matricularte" }
      end
    end
  end

  private

  def set_user
    @student = Student.find(params[:id])
  end

  def student_params
    params.fetch(:student, {}).permit(:first_name, :last_name, :email, :cui, :description, :clasification_id)
  end
end
