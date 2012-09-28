class UserMailer < ActionMailer::Base
  default from: "lucasmcastro@gmail.com"

  def certificate_email(user, certificate)
    @user = user
    @certificate = certificate
    debugger
    attachments["#{certificate.event} - #{user.name}.pdf"] = certificate.pdf_file()
    mail(:to => user.email, :subject => "#{certificate.event} - Envio de Certificado")
  end
end
