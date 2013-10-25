class MessagesController < ApplicationController

	def new
    if params.has_key?(:id)      
      if @member = Member.find(params[:id])
        @group = (params.has_key?(:group_id) ? @member.groups.where(id: params[:group_id]).first : @member.groups.first)
        
        if params.has_key?(:message)
          @message = @group.messages.create(member_id: @member.id, message: params[:message])
        else
          # message missing!
          @error = 1
        end
          
      else
        # invalid member id!
        @error = 1
      end
    else
      # missing the member id!
      @error = 1
    end

    render "messages/new", formats: [:json]
	end

	def get
    @messages = Array.new
    if params.has_key?(:group_id)      
      @message_id = -1
      @message_id = params[:message_id].to_i if params.has_key?(:message_id)
      
      if @group = Group.find(params[:group_id])
        @group.messages.each do |message|
          @message = message
                    
          @messages.push(@message) if @message.id > @message_id
        end
      end
    end
    
    render "messages/get", formats: [:json]
	end
end
