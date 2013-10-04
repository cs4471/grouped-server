class CheckinsController < ApplicationController
  
  def new
    @checkin = Checkin.new(params[:checkin]);
    @checkin.save
    
  end
  
  def index
    @group_id = params[:group_id]
    @checkins = [];
    
    Group.find(@group_id).members.each do |member|
      @checkins.push(member.checkin)
    end
    
    if params.has_key?(:last_checkin)
      @checkins.delete_if do |checkin|
        checkin.isOlder?(params[:last_checkin])
      end
    end
    
    render "checkins/list", formats: [:json]
  end
  
end
