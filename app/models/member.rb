class Member < ActiveRecord::Base
  attr_accessible :identity
  
  belongs_to :group
  has_one :checkin
end
