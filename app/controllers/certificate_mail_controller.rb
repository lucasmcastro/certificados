class CertificateMailController < ApplicationController
  def create
    @certificate = Certificate.find(params[:certificate_id])
    EmailWorker.perform_async(params[:certificate_id])
    flash[:notice] = 'Iniciado o envio do email.'
    redirect_to @certificate.student
  end
end
