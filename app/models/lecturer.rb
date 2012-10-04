class Lecturer < ActiveRecord::Base
  attr_accessible :email, :name, :phone, :dependent => :destroy

  has_many :certificates, :as => :certifiable
end
