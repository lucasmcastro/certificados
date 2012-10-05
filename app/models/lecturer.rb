class Lecturer < ActiveRecord::Base
  attr_accessible :email, :name, :phone, :resume, :certificate_attributes

  has_many :certificates, :as => :certifiable, :dependent => :destroy

  def certificate_attributes=(certificate_attributes)
    self.certificates.build(certificate_attributes)
  end
end