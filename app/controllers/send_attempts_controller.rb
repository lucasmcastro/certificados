# encoding: utf-8

class SendAttemptsController < ApplicationController
  def index
    @certificate = Certificate.find(params[:certificate_id])
    @send_attempts = @certificate.send_attempts
  end

  def destroy
    @send_attempt = SendAttempt.find(params[:id])
    @send_attempt.destroy
    redirect_to send_attempts_url
  end
end
