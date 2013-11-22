class GroupsController < ApplicationController

  def new	
    if params.has_key?(:name)
      if params.has_key?(:id)
        # we are just updating a groups info
        @group = Group.find(params[:id])
      else
        # we are creating a new group with the attributes included
        @group = Group.new
      end
  
      # take each parameter included and add the field to the group
      request.POST.each do |key, value| 
        # id is already set so ignore it
        @group[key.to_sym] = value unless key == :id
      end
  
    else
      # we are just creating a fresh group id
      @group = Group.new
    end
  
    @error = 1 unless @group.save
    
    render "groups/new", formats: [:json]
  end

  def join

    if params.has_key?(:id)
      @group = Group.find(params[:id])
  
      if params.has_key?(:member_id)
        @member = Member.find(params[:member_id])
      else
        @member = Member.create
      end
  
      @group.members << @member
    else
      # group id needed
      @error = 1
    end

  	render "groups/join", formats: [:json]
  end

  def leave
    if(params.has_key?(:member_id) and params.has_key?(:group_id))
      if true
        @group = Group.find(params[:group_id])
        @member = Member.find(params[:member_id])
        @group.members.delete(@member)

        MemberCheckin.where({member_id: @member.id, group_id: @group.id}).each do |checkin|
          checkin.destroy
        end
        @group.destroy if @group.members.empty?

      else
        @error = 1         
      end
    else 
      @error = 1
    end

  	render "groups/leave", formats: [:json]
  end
  
end
