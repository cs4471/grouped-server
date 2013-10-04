class GroupsController < ApplicationController
  
  def new
    @group = Group.new(name: params[:name]);
    @group.save
    
    unless @group.errors.empty?
      @error = @group.errors.full_messages.join(", ");
    end
    
    render "groups/new", formats: [:json]
  end
  
end
