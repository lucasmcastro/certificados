class Certificate < ActiveRecord::Base
  before_create :fill_defaults

  belongs_to :student
  has_many :send_attempts

  attr_accessible :event

  def attempts()
    self.send_attempts.count
  end

  def pdf_file()
    require 'pdfkit'
    certificate_url = Rails.application.routes.url_helpers.certificate_url(self,
        :host => "0.0.0.0", :port => "3000")
    kit = PDFKit.new(certificate_url, :orientation => 'Landscape',
        :margin_left => 2,
        :margin_right => 2,
        :margin_bottom => 2,
        :margin_top => 2)
    kit.to_pdf
  end

  def to_s
    "#{self.event} - #{self.student.name}"
  end

  def send_email
    EmailWorker.perform_async(self.id)
  end

  protected

  def fill_defaults
    self.uuid = UUID.new.generate
    self.sent = false
    true
  end
end
