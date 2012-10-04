class Student < ActiveRecord::Base
  has_many :certificates, :as => :certifiable, :dependent => :destroy

  attr_accessible :name, :cpf, :rg, :email, :phone1,
                    :phone2, :phone3, :address, :zip, :neighborhood,
                    :city, :sex, :birth_date, :occupation, :address_complement

  def create_certificate(event)
    cert = Certificate.new(:event => event)
    cert.student = self
    cert.save()
  end

end
