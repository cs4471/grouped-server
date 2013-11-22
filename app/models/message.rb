class Message < ActiveRecord::Base
  attr_accessible :member_id, :message
  
  belongs_to :member  
end
