class SendAttempt < ActiveRecord::Base
  belongs_to :certificate
  attr_accessible :message, :certificate
end
