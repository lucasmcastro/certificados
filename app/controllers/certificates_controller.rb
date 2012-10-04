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
    @certifiable = @certificate.certifiable

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @certificate }
    end
  end

  # GET /certificates/new
  # GET /certificates/new.json
  def new
    if params.has_key? :student_id
      @certifiable = Student.find(params[:student_id])
    end
    @certificate = Certificate.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @certificate }
    end
  end

  # POST /certificates
  # POST /certificates.json
  def create
    if params.has_key? :student_id
      @certifiable = Student.find(params[:student_id])
    end
    @certificate = Certificate.new(params[:certificate])
    @certificate.certifiable = @certifiable

    respond_to do |format|
      if @certificate.save
        format.html { redirect_to @certificate, notice: 'Certificate was successfully created.' }
        format.json { render json: @certificate, status: :created, location: @certificate }
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
    certifiable = @certificate.certifiable
    @certificate.destroy

    respond_to do |format|
      format.html { redirect_to certifiable }
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