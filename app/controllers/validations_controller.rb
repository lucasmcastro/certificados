# encoding: utf-8

class ValidationsController < ApplicationController
  def new
  end

  def create
    uuid = params[:certificate][:uuid]
    certificate = Certificate.find_by_uuid(uuid)
    if certificate
      redirect_to validation_path(certificate, :format => :pdf)
    else
      flash[:notice] = 'Certificado não encontrado'
      render :new
    end
  end

  def show
  end
end

