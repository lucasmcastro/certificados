class EmailWorker
    include Sidekiq::Worker
    sidekiq_options retry: false

    def perform(certificate_id)
        certificate = Certificate.find(certificate_id)

        attempt = SendAttempt.create(:certificate=>certificate, :message=>"Envio Iniciado...")
        mail = UserMailer.certificate_email(certificate).deliver

        attempt.update_attribute(:message, "Envio Finalizado!")
        certificate.update_attribute(:sent, true)
    end
end