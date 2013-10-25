class AddLastCheckinToMember < ActiveRecord::Migration
  def change
    change_table :members do |t|
      t.integer :last_checkin
    end
    remove_column :groups, :message_count
  end
end
