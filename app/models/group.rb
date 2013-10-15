class Group < ActiveRecord::Base
  attr_accessible :name, :event, :length, :roam, :checkin_count, :message_count
  
  has_and_belongs_to_many :members
  
end
