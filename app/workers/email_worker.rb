class EmailWorker
    include Sidekiq::Worker
    sidekiq_options retry: false

    def perform(certificate_id)
        certificate = Certificate.find(certificate_id)
        student = certificate.student

        attempt = SendAttempt.create(:certificate=>certificate, :message=>"Iniciando Envio")
        mail = UserMailer.certificate_email(student, certificate).deliver

        attempt.update_attribute(:message, "Envio Realizado")
        certificate.update_attribute(:sent, true)
    end
end