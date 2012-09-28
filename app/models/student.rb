class Student < ActiveRecord::Base
  has_many :certificates
  attr_accessible :cpf, :email, :name, :phone
end
