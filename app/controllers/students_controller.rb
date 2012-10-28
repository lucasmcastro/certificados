# encoding: utf-8

class StudentsController < ApplicationController
  def new_import
  end

  def create_import
    students = params[:certifiable_attributes]
    students.each do |student|
      certificate = student[:certificate_attributes]
      certificate['kind'] = "course"
      student.delete :certificate_attributes
      s = Student.create(student)
      s.certificates.create(certificate)
    end
    redirect_to students_path
  end

  def index
    @students = Student.all
  end

  def show
    @student = Student.find(params[:id])
  end

  def new
    @student = Student.new
  end

  def edit
    @student = Student.find(params[:id])
  end

  def create
    @student = Student.new(params[:student])
    if @student.save
      redirect_to @student, notice: 'Student was successfully created.'
    else
      render :new
    end
  end

  def update
    @student = Student.find(params[:id])
    if @student.update_attributes(params[:student])
      redirect_to @student, notice: 'Student was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @student = Student.find(params[:id])
    @student.destroy
    redirect_to students_url
  end
end
