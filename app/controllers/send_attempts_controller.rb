class SendAttemptsController < ApplicationController
  # GET /send_attempts
  # GET /send_attempts.json
  def index
    @certificate = Certificate.find(params[:certificate_id])
    @send_attempts = @certificate.send_attempts

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @send_attempts }
    end
  end

  # DELETE /send_attempts/1
  # DELETE /send_attempts/1.json
  def destroy
    @send_attempt = SendAttempt.find(params[:id])
    @send_attempt.destroy

    respond_to do |format|
      format.html { redirect_to send_attempts_url }
      format.json { head :no_content }
    end
  end
end
