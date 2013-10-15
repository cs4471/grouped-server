class AddColumnsToGroup < ActiveRecord::Migration
  def change
  	change_table :groups do |t|
	  t.string :event
	  t.string :length
	  t.string :roam
	end
  end
end
