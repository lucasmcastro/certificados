class UserMailer < ActionMailer::Base
  default from: "no-reply@itcursos.com.br"

  def certificate_email(certificate)
    @user = certificate.certifiable
    @certificate = certificate
    attachments["#{certificate.event} - #{@user.name}.pdf"] = certificate.pdf_file()
    mail(:to => @user.email,
        :subject => "#{certificate.event} - Envio de Certificado",
        :cc => "mkt@itcursos.com.br")
  end
end
