class AddDefaultToCounts < ActiveRecord::Migration
  def change
    change_column_default :groups, :checkin_count, 0
    change_column_default :groups, :message_count, 0
  end
end
