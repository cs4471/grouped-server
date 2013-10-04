class Checkin < ActiveRecord::Base
  # attr_accessible :title, :body
  
  belongs_to :member
  
  def is_older?(timestamp)
    return false
  end
end
