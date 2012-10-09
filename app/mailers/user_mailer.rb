class UserMailer < ActionMailer::Base
  default from: "no-reply@itcursos.com.br"

  def certificate_email(certificate)
    @user = certificate.certifiable
    @certificate = certificate
    attachments["#{certificate.title} - #{@user.name}.pdf"] = certificate.pdf_file()
    mail(:to => @user.email,
        :subject => "IT Cursos - Envio de Certificado",
        :cc => "coordenacao@itcursos.com.br")
  end
end
