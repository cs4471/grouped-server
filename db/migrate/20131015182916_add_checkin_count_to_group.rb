class AddCheckinCountToGroup < ActiveRecord::Migration
  def change
    change_table :groups do |t|
      t.integer :checkin_count
      t.integer :message_count
    end
  end
end
