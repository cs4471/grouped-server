class MemberCheckin < ActiveRecord::Base
  attr_accessible :checkin_id, :group_id, :member_id
  
  belongs_to :group
  belongs_to :member
  
end
