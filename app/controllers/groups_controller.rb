class GroupsController < ApplicationController
  
  def new
    @group = Group.new(name: params[:name]);
   
    if @group.save
      @id = @group.id;
    elsif params[:name].present? == false
      @error = 1
    end
    
    render "groups/new", formats: [:json]
  end
  
end
