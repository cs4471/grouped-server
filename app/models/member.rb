class Member < ActiveRecord::Base
  attr_accessible :certainty, :lat, :lng, :nickname, :status
  
  has_many :messages
  has_and_belongs_to_many :groups
  
end
