# encoding: utf-8

class LecturersController < ApplicationController
  def new_import
  end

  def create_import
    lecturers = params[:certifiable_attributes]
    lecturers.each do |lecturer|
      certificate = lecturer[:certificate_attributes]
      certificate[:kind] = "event"
      certificate[:course_code] = certificate[:event]
      lecturer.delete :certificate_attributes
      l = Lecturer.create(lecturer)
      l.certificates.create(certificate)
    end

    redirect_to lecturers_path
  end

  def index
    @lecturers = Lecturer.all
  end

  def show
    @lecturer = Lecturer.find(params[:id])
  end

  def new
    @lecturer = Lecturer.new
  end

  def edit
    @lecturer = Lecturer.find(params[:id])
  end

  def create
    @lecturer = Lecturer.new(params[:lecturer])

    if @lecturer.save
      redirect_to @lecturer, notice: 'Lecturer was successfully created.'
    else
      render :new
    end
  end

  def update
    @lecturer = Lecturer.find(params[:id])
    if @lecturer.update_attributes(params[:lecturer])
      redirect_to @lecturer, notice: 'Lecturer was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @lecturer = Lecturer.find(params[:id])
    @lecturer.destroy
    redirect_to lecturers_url
  end
end
