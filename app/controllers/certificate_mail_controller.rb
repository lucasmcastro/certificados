# encoding: utf-8

class CertificateMailController < ApplicationController
  def create
    @certificate = Certificate.find(params[:certificate_id])
    @certificate.send_email
    flash[:notice] = 'Iniciado o envio do email.'
    redirect_to @certificate.certifiable
  end
end
