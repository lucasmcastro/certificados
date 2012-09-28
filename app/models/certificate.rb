class Certificate < ActiveRecord::Base
  belongs_to :student
  attr_accessible :event

  def pdf_file()
    require 'pdfkit'
    certificate_url = Rails.application.routes.url_helpers.certificate_url(self,
        :host => "certificados.dev")
    kit = PDFKit.new(certificate_url, :orientation => 'Landscape',
        :margin_left => 2,
        :margin_right => 2,
        :margin_bottom => 2,
        :margin_top => 2)
    kit.to_pdf
  end
end
