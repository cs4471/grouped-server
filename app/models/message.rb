class Message < ActiveRecord::Base
  attr_accessible :member_id, :group_id, :message
  
  belongs_to :member
  belongs_to :group
  
end
