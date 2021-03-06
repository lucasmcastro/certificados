class Certificate < ActiveRecord::Base
  before_create :fill_defaults

  belongs_to :certifiable, :polymorphic => true
  has_many :send_attempts, :dependent => :destroy

  attr_accessible :event, :lecture, :course, :course_code, :duration,
                  :start_date, :end_date, :topics, :kind

  validates :course_code, :duration, :certifiable_id, :presence => true
  validates :start_date, :end_date, :course, :presence => true, :if => :course?
  validates :event, :presence => true, :if => :event?
  validates :lecture, :presence => true, :if => :event_and_lecturer?
  delegate :name, :to => :certifiable, :prefix => true

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
        :margin_top => 2,
        :encoding => 'UTF-8')
    kit.to_pdf
  end

  def title
    self.send self.kind
  end

  def send_email
    EmailWorker.perform_async(self.id)
  end

  protected
  def event?
    self.kind == "event"
  end

  def event_and_lecturer?
    self.kind == "event" and self.certifiable_type == "Lecturer"
  end

  def course?
    self.kind == "course"
  end

  def fill_defaults
    self.uuid = UUID.new.generate
    self.sent = false
    true
  end
end
