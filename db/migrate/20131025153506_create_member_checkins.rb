class CreateMemberCheckins < ActiveRecord::Migration
  def change
    create_table :member_checkins do |t|
      t.integer :group_id
      t.integer :member_id
      t.integer :checkin_id

      t.timestamps
    end
    
    remove_column :members, :last_checkin
    remove_column :groups, :checkin_count
  end
end
