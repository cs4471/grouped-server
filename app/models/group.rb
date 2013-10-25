class Group < ActiveRecord::Base
  attr_accessible :name, :event, :length, :roam
  
  has_many :member_checkins
  has_many :messages
  has_and_belongs_to_many :members
  
end
