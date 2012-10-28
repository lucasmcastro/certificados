# encoding: utf-8

class CertificatesController < ApplicationController
  layout "certificate", :only => [:show]

  def index
  end

  def show
    @certificate = Certificate.find(params[:id])
    @certifiable = @certificate.certifiable
  end

  def new
    if params.has_key? :student_id
      @certifiable = Student.find(params[:student_id])
    else
      @certifiable = Lecturer.find(params[:lecturer_id])
    end
    @certificate = Certificate.new
  end

  def create
    if params.has_key? :student_id
      @certifiable = Student.find(params[:student_id])
    else
      @certifiable = Lecturer.find(params[:lecturer_id])
    end
    @certificate = Certificate.new(params[:certificate])
    @certificate.certifiable = @certifiable
    if @certificate.save
      redirect_to @certificate, notice: 'Certificate was successfully created.'
    else
      render :new
    end
  end

  def destroy
    @certificate = Certificate.find(params[:id])
    certifiable = @certificate.certifiable
    @certificate.destroy
    redirect_to certifiable
  end

  def search
    certificate = Certificate.find_by_uuid!(params[:certificate][:search])
    redirect_to certificate
  rescue ActiveRecord::RecordNotFound
    flash[:error] = "Não há certificado identificado por #{params[:certificate][:search]}."
    render :index
  end

  def filter
    @certificates = Certificate.find_all_by_course_code(params[:certificate][:filter])
    render :index
  end
end
