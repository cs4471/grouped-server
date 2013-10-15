class Member < ActiveRecord::Base
  attr_accessible :certainty, :lat, :lng, :nickname, :status
  
  has_many :groups
end
