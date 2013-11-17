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
        @error = 4 unless @member.save
      else
        # invalid member id!
        @error = 5
      end
    else
      # missing the member id!
      @error = 6
    end

    @min = Array.new
    # update each groups checkin count
    @member.groups.each do |group|
      if group.member_checkins.empty?
        @checkin_id = 0
      else
        @checkin_id = group.member_checkins.size
      end
      # keep track of checkin ids to pick the lowest one later
      @min.push(@checkin_id)
      
      group.member_checkins.create(member_id: @member.id, checkin_id: @checkin_id)
    end
    
    # give them the lowest one
    @checkin_id = @min.min
    
  	render "members/new_checkin", formats: [:json]
  end

  def get
    @checkins = Array.new
    if params.has_key?(:group_id)      
      @checkin_id = -1
      @checkin_id = params[:checkin_id].to_i if params.has_key?(:checkin_id)
      
      if @group = Group.find(params[:group_id])
        @group.members.each do |member|
          @checkin = Hash.new
          @checkin[:id] = member.member_checkins.where(group_id: params[:group_id]).first.checkin_id
          @checkin[:member_id] = member.id
          @checkin[:nickname] = member.nickname unless member.nickname.nil?
          @checkin[:status] = member.status unless member.status.nil?
          
          unless member.lat.nil? 
            @checkin[:location] = Hash.new
            @checkin[:location][:lat] = member.lat
            @checkin[:location][:lng] = member.lng
            @checkin[:location][:certainty] = member.certainty
          end
          
          @checkins.push(@checkin) if @checkin[:id] > @checkin_id
        end
      else
        
        # group with provided id does not exist
        @error = 3
      end
      
    else
      # missing group id!
      @error = 2
    end
    
  	render "members/get_checkins", formats: [:json]
  end

end
