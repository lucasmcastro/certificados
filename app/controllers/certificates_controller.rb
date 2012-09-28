class CertificatesController < ApplicationController
  layout "certificate", :only => [:show]
  # GET /certificates
  # GET /certificates.json
  def index

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @certificates }
    end
  end

  # GET /certificates/1
  # GET /certificates/1.json
  def show

    @certificate = Certificate.find(params[:id])
    @student = @certificate.student

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @certificate }
    end
  end

  # GET /certificates/new
  # GET /certificates/new.json
  def new
    @student = Student.find(params[:student_id])
    @certificate = Certificate.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @certificate }
    end
  end

  # POST /certificates
  # POST /certificates.json
  def create
    @certificate = Certificate.new(params[:certificate])
    @student = Student.find(params[:student_id])
    @certificate.student = @student


    respond_to do |format|
      if @certificate.save
        format.html { redirect_to @student, notice: 'Certificate was successfully created.' }
        format.json { render json: @student, status: :created, location: @certificate }
      else
        format.html { render action: "new" }
        format.json { render json: @certificate.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /certificates/1
  # DELETE /certificates/1.json
  def destroy
    @certificate = Certificate.find(params[:id])
    @student = @certificate.student
    @certificate.destroy

    respond_to do |format|
      format.html { redirect_to @student }
      format.json { head :no_content }
    end
  end

  def search
    certificate = Certificate.find_by_uuid!(params[:certificate][:search])
    redirect_to certificate
  rescue ActiveRecord::RecordNotFound
    flash[:error] = "Nao ha certificado identificado por #{params[:certificate][:search]}."
    render action: "index"
  end
end
