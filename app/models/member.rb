class Member < ActiveRecord::Base
  attr_accessible :certainty, :lat, :lng, :nickname, :status
  
  has_and_belongs_to_many :groups
end
