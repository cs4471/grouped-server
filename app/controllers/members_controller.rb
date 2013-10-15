class MembersController < ApplicationController

  def checkin
    if params.has_key?(:id)      
      if @member = Member.find(params[:id])
        # take each parameter included and update the member with it
        params.each do |key, value| 
          # id is already set so ignore it
          @member[key.to_sym] = value unless key == :id
        end
        
        # error saving the member attributes
        @error = 1 unless @member.save
      else
        # invalid member id!
        @error = 1
      end
    else
      # missing the member id!
      @error = 1
    end

    # update each groups checkin count
    @member.groups.each do |group|
      group.checkin_count = group.checkin_count + 1
      group.save
      @checkin_id = group.checkin_count
    end
    
  	render "members/new_checkin", formats: [:json]
  end

  def get

  	render "members/get_checkins", formats: [:json]
  end

end
