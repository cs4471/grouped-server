class GroupsController < ApplicationController
  
  def new
    @group = Group.new(name: params[:group_name]);
   
    if @group.save
      @id = @group.id;
    elsif params[:group_name].present? == false
      @error = 1
    end
    
    render "groups/new", formats: [:json]
  end
  
end
